class SightingsController < ApplicationController
    def index
        @animals = Animal.all
    end

    def show
        @animal = Animal.find(params[:id])
        @sightings = Sighting.where(animal_id: params[:id])
    end
    
    def new
        # go to Add Sighting Page
        @id = params[:format]
        @sighting = Sighting.new
    end
    def create
        @sighting = Sighting.new(sighting_params)
        if @sighting.save
            redirect_to animals_path
        else
            render action: :new
        end
    end
    
    def edit
        @sighting = Sighting.new
    end
    def update
        @sighting = Sighting.find(params[:id])
        if @sighting.update_attributes(sightings_params)
            redirect_to animals_path
        else
            render :update
        end
    end
    
    def destroy
        @sighting = Sighting.find(params[:id])
        @sighting.destroy
        render :show #redirect_to sighting_path
    end
    
    private
    
    def sightings_params
        params.require(:sighting).permit(:time, :date, :latitude, :longitude)
    end
    
    def sighting_params
        params.require(:sighting).permit(:time, :date, :latitude, :longitude, :animal_id)
    end
end
