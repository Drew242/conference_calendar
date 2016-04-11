class LandingController < ApplicationController
  def index
    @events = Event.all.where(day: first_day)
    @next_day = @events.first.day
  end

  def next_day
    @events = Event.all.where(day: last_day)
    @next_day = @events.first.day
    render :index
  end

  private

  def first_day
    Event.first.start_time.strftime("%m/%d")
  end

  def last_day
    Event.last.start_time.strftime("%m/%d")
  end
end
