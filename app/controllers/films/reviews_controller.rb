# frozen_string_literal: true

module Films
  class ReviewsController < ApplicationController
    def create
      @film   = Film.find(params[:film_id])
      @review = Review.create(film: @film, **comment_params)

      return create_failure if @review.errors.any?

      redirect_to film_path(@film, anchor: 'new-review'),
                  notice: I18n.t('films.reviews.create.success')
    end

    private

    def comment_params
      params.require(:review).permit(:text)
    end

    def create_failure
      redirect_to film_path(@film, anchor: 'new-review'),
                  alert: @review.errors.full_messages.first
    end
  end
end
