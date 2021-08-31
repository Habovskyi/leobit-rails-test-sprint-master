# frozen_string_literal: true

describe ReviewsController, type: :controller do
  describe '#destroy' do
    subject { delete :destroy, params: params }

    let!(:review) { create(:review) }
    let(:params)  { { id: review.id } }

    it 'removes review' do
      expect { subject }.to change(Review, :count).by(-1)
    end

    it 'redirects to film page' do
      expect(subject).to redirect_to(film_path(review.film, anchor: 'new-review'))
    end

    it 'sets flash message' do
      subject
      expect(controller).to set_flash[:notice].to(I18n.t('reviews.destroy.message'))
    end

    context 'with wrong id' do
      let(:params) { { id: -1 } }

      it 'raises not found exception' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
