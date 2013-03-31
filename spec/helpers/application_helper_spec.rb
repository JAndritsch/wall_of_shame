require 'spec_helper'

describe ApplicationHelper do
  describe "show_flash" do
    before do
      flash[:error] = flash[:message] = nil
    end

    it "doesn't show anything if neither flash[:error] or flash[:success are present" do
      show_flash.should be_blank
    end

    it "shows an alert message when flash[:error] is present" do
      flash[:error] = "this is an error message"
      show_flash.should match(/alert-error/)
      show_flash.should match(/this is an error message/)
    end

    it "shows an alert message when flash[:message] is present" do
      flash[:message] = "this is a success message"
      show_flash.should match(/alert-success/)
      show_flash.should match(/this is a success message/)
    end

    it "shows an alert message when both flash messages are present" do
      flash[:error] = "this is an error message"
      flash[:message] = "this is a success message"
      show_flash.should match(/alert-error/)
      show_flash.should match(/alert-success/)
      show_flash.should match(/this is an error message/)
      show_flash.should match(/this is a success message/)
    end
  end
end
