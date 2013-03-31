require 'spec_helper'

describe ParkingViolationsController do
  describe "index" do
    it "renders the 'index' view" do
      get :index
      response.should render_template(:index)
    end
  end

  describe "new" do
    it "renders the 'new' view" do
      get :new
      response.should render_template(:new)
    end
  end

  describe "create" do
    context "the car exists already" do
      before do
        @car = Car.create(:plate_number => "123-ABC", :plate_state => "WI")
        Car.stub(:find).and_return(@car)
      end

      it "creates and assigns the parking violation to the found car" do
        Car.should_not_receive(:create)
        post :create, :car => {:plate_number => "123-ABC", :plate_state => "WI"}, :violation => {}
        @car.parking_violations.count.should == 1
      end

      it "renders the 'new' view" do
        post :create, :car => {:plate_number => "123-ABC", :plate_state => "WI"}, :violation => {}
        response.should render_template(:new)
      end
    end

    context "the car does not exist" do
      before do
        @car = Car.create(:plate_number => "456-DEF", :plate_state => "WI")
        Car.stub(:find).and_return(nil)
      end

      it "creates and assigns the parking violation to the new car" do
        Car.should_receive(:create).and_return(@car)
        post :create, :car => {:plate_number => "456-DEF", :plate_state => "WI"}, :violation => {}
        @car.parking_violations.count.should == 1
      end

      it "should redirect you to the edit action of the cars controller" do
        Car.stub(:create).and_return(@car)
        post :create, :car => {:plate_number => "789-GHI", :plate_state => "WI"}, :violation => {}
        response.should redirect_to(edit_car_path(:id => @car.id))
      end
    end
  end
end
