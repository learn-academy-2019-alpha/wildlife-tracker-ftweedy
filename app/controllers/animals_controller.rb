class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
    end
    
    def new
        # go to Add Animal Page
        @animal = Animal.new
    end
    def create
        @animal = Animal.new(animal_params)
        if @animal.save
            redirect_to animals_path
        else
            render action: :new
        end
    end
    
    def update
        @animal = Animal.find(params[:id])
        if @animal.update_attributes(animal_params)
            redirect_to animals_path
        else
            render :edit
        end
    end
    def edit
        @animal = Animal.new
    end
    
    def destroy
        @animal = Animal.find(params[:id])
        @animal.destroy
        redirect_to animals_path
    end
    
    private
    
    def animal_params
        params.require(:animal).permit(:name, :latin_name, :kingdom)
    end
end
