require 'spec_helper'

describe ParkingViolationsController do
  describe "index" do
    it "shows the parking violation form" do
      get :index
      response.should render_template(:index)
    end
  end
end
