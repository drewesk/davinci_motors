class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @car = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      created_message = "#{@car.year} #{@car.make} #{@car.model} created"
      redirect_to root_path,
        notice: created_message
    else
      error_message = "#{@car.errors.full_messages}"
      redirect_to root_path,
        notice: error_message
    end
  end

  def update
    updated_message = 'Car was successfully updated'
    @car.update(car_params)
    redirect_to root_path,
      notice: updated_message
  end

  def destroy
    @car.destroy
    redirect_to cars_url,
      notice: 'Car was successfully destroyed'
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
