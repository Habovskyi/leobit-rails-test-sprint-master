# frozen_string_literal: true

describe ActorsController, type: :controller do
  describe '#index' do
    subject { get :index }

    let(:max_count) { 3 }
    let!(:actors)   { create_list(:actor, rand(4..7)) }

    let(:expected_list) { actors.sort_by(&:created_at).reverse.take(max_count) }

    before do
      stub_const("#{Pagy}::VARS", Pagy::VARS.merge(items: max_count))

      subject
    end

    it 'returns pagy object' do
      expect(assigns(:pagy)).to be_a(Pagy)
    end

    it 'returns paginated ordered list' do
      expect(assigns(:actors)).to eq(expected_list)
    end
  end

  describe '#show' do
    subject { get :show, params: { id: actor.id } }

    let(:actor) { create(:actor) }

    before { subject }

    it 'returns actor' do
      expect(assigns(:actor)).to eq(actor)
    end
  end

  describe '#new' do
    subject { get :new }

    before { subject }

    it 'returns actor' do
      expect(assigns(:actor)).to be_an(Actor)
    end

    it 'returns new record' do
      expect(assigns(:actor)).not_to be_persisted
    end
  end

  describe '#create' do
    subject { post :create, params: { actor: params } }

    let(:params) { common_params }
    let(:common_params) do
      {
        full_name:        Faker::Name.name,
        description:      Faker::Lorem.paragraph_by_chars(number: 25),
        number_of_oscars: rand(11),
        gender:           Actor.genders.values.sample,
        is_married:       true
      }
    end

    it 'adds one actor' do
      expect { subject }.to change(Actor, :count).by(1)
    end

    it 'creates actor with passed params' do
      subject
      expect(assigns(:actor)).to have_attributes(params)
    end

    it 'redirects to actors page' do
      expect(subject).to redirect_to(actors_path)
    end

    it 'sets flash message' do
      subject
      expect(controller)
        .to set_flash[:notice]
        .to(I18n.t('actors.create.success', name: params[:full_name]))
    end

    context 'with wrong full name' do
      let(:params) { common_params.merge(full_name: '') }

      it 'does not create actor' do
        expect { subject }.not_to change(Actor, :count)
      end
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: params }

    let!(:actor) { create(:actor) }
    let(:params) { { id: actor.id } }

    it 'removes actor' do
      expect { subject }.to change(Actor, :count).by(-1)
    end

    it 'redirects to actors page' do
      expect(subject).to redirect_to(actors_path)
    end

    it 'sets flash message' do
      subject
      expect(controller)
        .to set_flash[:notice]
        .to(I18n.t('actors.destroy.message', name: actor.full_name))
    end

    context 'with wrong id' do
      let(:params) { { id: -1 } }

      it 'raises not found exception' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
