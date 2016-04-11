class LandingController < ApplicationController
  def index
    @events = Event.all.where(day: first_day)
  end

  private

    def first_day
      Event.first.start_time.strftime("%m/%d")
    end

end
