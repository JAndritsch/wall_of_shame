class ParkingViolationsController < ApplicationController
  def index
  end

  def new
  end

  def create
    plate_number = params[:car][:plate_number]
    plate_state  = params[:car][:plate_state]
    car = Car.find(:first, :conditions => {
      :plate_number => plate_number,
      :plate_state  => plate_state
    })
    car_created = false
    if car
      @car = car
    else
      @car = Car.create(:plate_number => plate_number, :plate_state => plate_state)
      car_created = true
    end

    @violation = ParkingViolation.new(params[:violation])
    @violation.car = @car

    if @violation.save
      flash[:message] = "The violation was created."
      if car_created
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
