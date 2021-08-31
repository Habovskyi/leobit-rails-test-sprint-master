# frozen_string_literal: true

class FilmsController < ApplicationController
  before_action :find_film!, only: %i[show destroy]

  def index
    @films = Film.includes(:photo_blob).order(created_at: :desc)
  end

  def show
    @review = Review.new
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.create(film_params)

    return render :new if @film.errors.any?

    redirect_to films_path, notice: I18n.t('films.create.success')
  end

  # JSON response example
  def destroy
    @film.destroy!

    respond_to do |format|
      format.html { redirect_to films_path, notice: I18n.t('films.destroy.message') }
      format.json do
        render json: { data: { message: I18n.t('films.destroy.json_message', name: @film.name) } }
      end
    end
  end

  private

  def find_film!
    @film = Film.find(params[:id])
  end

  def film_params
    params.require(:film).permit(:name, :description)
  end
end
