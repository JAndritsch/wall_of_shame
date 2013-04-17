require 'spec_helper'

describe CarsController do
  describe "edit" do
    it "looks up the car and renders you a form for editing" do
      Car.should_receive(:find).and_return(Car.new)
      get :edit, :id => 1
      response.should render_template(:edit)
    end
  end
end
