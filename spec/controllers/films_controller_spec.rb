# frozen_string_literal: true

describe FilmsController, type: :controller do
  describe '#index' do
    subject { get :index }

    let!(:films)        { create_list(:film, rand(4..7)) }
    let(:expected_list) { films.sort_by(&:created_at).reverse }

    before { subject }

    it 'returns paginated ordered list' do
      expect(assigns(:films)).to eq(expected_list)
    end
  end

  describe '#show' do
    subject { get :show, params: { id: film.id } }

    let(:film) { create(:film) }

    before { subject }

    it 'returns film' do
      expect(assigns(:film)).to eq(film)
    end

    it 'returns review' do
      expect(assigns(:review)).to be_a(Review)
      expect(assigns(:review)).not_to be_persisted
    end
  end

  describe '#create' do
    subject { post :create, params: { film: params } }

    let(:params) { common_params }
    let(:common_params) do
      {
        name:        Faker::Movie.title,
        description: Faker::Lorem.paragraph_by_chars(number: 100)
      }
    end

    it 'adds one film' do
      expect { subject }.to change(Film, :count).by(1)
    end

    it 'creates film with passed params' do
      subject
      expect(assigns(:film)).to have_attributes(params)
    end

    it 'redirects to films page' do
      expect(subject).to redirect_to(films_path)
    end

    it 'sets flash message' do
      subject
      expect(controller).to set_flash[:notice].to(I18n.t('films.create.success'))
    end

    context 'with wrong name' do
      let(:params) { common_params.merge(name: '') }

      it 'does not create film' do
        expect { subject }.not_to change(Film, :count)
      end
    end

    context 'with short description' do
      let(:params) { common_params.merge(description: Faker::Lorem.paragraph_by_chars(number: 49)) }

      it 'does not create film' do
        expect { subject }.not_to change(Film, :count)
      end
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: params, **format_params }

    let!(:film) { create(:film) }

    let(:format_params) { {} }
    let(:params)        { { id: film.id } }

    it 'removes film' do
      expect { subject }.to change(Film, :count).by(-1)
    end

    it 'redirects to films page' do
      expect(subject).to redirect_to(films_path)
    end

    it 'sets flash message' do
      subject
      expect(controller).to set_flash[:notice].to(I18n.t('films.destroy.message'))
    end

    context 'on json' do
      let(:format_params) { { format: :json } }
      let(:expected_data) do
        { data: { message: I18n.t('films.destroy.json_message', name: film.name) } }
      end

      it 'returns json response' do
        subject
        expect(response.body).to eq(expected_data.to_json)
      end
    end

    context 'with wrong id' do
      let(:params) { { id: -1 } }

      it 'raises not found exception' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
