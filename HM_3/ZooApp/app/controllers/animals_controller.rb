class AnimalsController < ApplicationController
  before_action :find_animal, only: [:show, :edit, :update, :destroy]

  def index
    @animals = Animal.all
  end

  def new 
    @animal = Animal.new 
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      redirect_to animal
    else 
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to action: "index"
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :animal_class)
  end

  def find_animal
    @animal = Animal.find(params[:id])
  end
end
