class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[ show update destroy ]

  # GET /planets
  def index
    render json: Planet.all
  end

  def show
    render json: @planet
  end

  def create
    planet = Planet.create!(planet_params)
    render json: planet, status: :created
  end

  def update
    @planet.update!(planet_params) 
    render json: @planet, status: :accepted
  end

  def destroy
    @planet.destroy
    head :no_content
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.permit(:name, :distance_from_earth, :nearest_star, :image)
  end
end
