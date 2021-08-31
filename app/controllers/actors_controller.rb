# frozen_string_literal: true

class ActorsController < ApplicationController
  before_action :find_actor!, only: %i[show destroy]

  def index
    @pagy, @actors = pagy(Actor.order(created_at: :desc))
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.create(actor_params)

    return render :new if @actor.errors.any?

    redirect_to actors_path, notice: I18n.t('actors.create.success')
  end

  def destroy
    @actor.destroy!

    redirect_to actors_path, notice: I18n.t('actors.destroy.message', name: @actor.full_name)
  end

  private

  def find_actor!
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:full_name, :description, :number_of_oscars, :gender, :is_married)
  end
end
