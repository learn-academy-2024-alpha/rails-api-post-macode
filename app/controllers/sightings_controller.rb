class SightingsController < ApplicationController
  def index
  sightings = Sighting.all
  end

  def show
    sighting = Sighting.find(params[:id])
  end

  def create
    sighting = Sighting.create(sighting_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end

  def update
    sighting = Sighting.find(params[:id])
    sighting.update(sighting_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end

  def destroy
    sighting = Sighting.find(params[:id])
    if sighting.destroy
      render json: sighting
    else
      render json: sighting.errors
    end
  end


  private
  def sighting_params
    params.require(:sighting).permit(:latitude, :longitude, :date, :animal_id)
  end
end
