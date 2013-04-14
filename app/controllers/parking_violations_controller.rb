class ParkingViolationsController < ApplicationController
  def index
  end

  def new
  end

  # This could use some refactoring. The idea is to create or lookup the car based on
  # its license plate, then create and assign the parking violation to it in one simple
  # step. If the car was created, then we should send the user to go and finish filling
  # out the information for that new car after the violation was created. Otherwise, 
  # just re-render the new parking violation view.
  def create
    plate_number = params[:car][:plate_number]
    plate_state  = params[:car][:plate_state]
    @car = Car.find_by_plate_number_and_plate_state(plate_number, plate_state) || Car.create(params[:car])

    @violation = ParkingViolation.new(params[:violation])
    @violation.car = @car

    if @violation.save
      flash[:message] = "The violation was created."
      if @car
        flash[:message] += " Please continue filling out information for the new car."
        redirect_to edit_car_path(@car)
      else
        render :new
      end
    else
      flash[:error] = "The violation was not created!"
      @errors = @violation.errors
      render :new
    end

  end
end
