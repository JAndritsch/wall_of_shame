class CarsController < ApplicationController
  def edit
    @car = Car.find(params[:id])
  end
end
