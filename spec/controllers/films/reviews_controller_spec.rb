# frozen_string_literal: true

describe Films::ReviewsController, type: :controller do
  describe '#create' do
    subject { post :create, params: { film_id: film_id, review: params } }

    let(:film)    { create(:film) }
    let(:film_id) { film.id }
    let(:params)  { { text: Faker::Lorem.paragraph_by_chars(number: 15) } }

    it 'adds one review' do
      expect { subject }.to change(Review, :count).by(1)
    end

    it 'creates review with passed params' do
      subject
      expect(assigns(:review)).to have_attributes(params)
    end

    it 'finds and assigns film' do
      subject
      expect(assigns(:film)).to eq(film)
    end

    it 'redirects to film page' do
      expect(subject).to redirect_to(film_path(film, anchor: 'new-review'))
    end

    it 'sets flash message' do
      subject
      expect(controller).to set_flash[:notice].to(I18n.t('films.reviews.create.success'))
    end

    context 'with short text' do
      let(:params) { { text: Faker::Lorem.paragraph_by_chars(number: 9) } }

      it 'does not create review' do
        expect { subject }.not_to change(Review, :count)
      end
    end

    context 'when wrong film id is passed' do
      let(:film_id) { -1 }

      it 'raises record not found exception' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
