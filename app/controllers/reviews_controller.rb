# frozen_string_literal: true

class ReviewsController < ApplicationController
  def destroy
    review = Review.find(params[:id])
    review.destroy

    redirect_to film_path(review.film, anchor: 'new-review'),
                notice: I18n.t('reviews.destroy.message')
  end
end
