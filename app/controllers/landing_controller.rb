class LandingController < ApplicationController
  def index
    @events = Event.all
  end
end
