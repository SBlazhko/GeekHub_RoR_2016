class CarsController < ApplicationController
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new 
    @car = Car.new 
  end

  def create
    car = Car.new(car_params)
    if car.save
      redirect_to car
    else 
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to action: "index"
  end

  private

  def car_params
    params.require(:car).permit(:name, :car_type, :price)
  end

  def find_car
    @car = Car.find(params[:id])
  end 
end
