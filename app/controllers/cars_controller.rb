class CarsController < ApplicationController
  def index
    @car = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    car = Car.new(car_params)
    message = "#{car.year} #{car.make} #{car.model} created"
    redirect_to root_path,
      notice: message
  end

  def update
  end

  def destroy
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end




