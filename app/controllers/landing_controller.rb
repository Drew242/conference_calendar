class LandingController < ApplicationController
  def index
    @events      = Event.all.where(day: first_day)
    @current_day = @events.last.day
    @next_day    = all_days[all_days.index(@current_day) + 1]
  end

  def next_day
    @events      = Event.all.where(day: params[:next_day])
    @current_day = @events.last.day
    @next_day    = all_days[all_days.index(@current_day) + 1] ||= first_day
    render :index
  end

  private

  def first_day
    Event.first.start_time.strftime("%m/%d")
  end

  def last_day
    Event.last.start_time.strftime("%m/%d")
  end

  def all_days
    a = []
    Event.all.each do |e|
      a << e.day
    end
    a.uniq
  end
end
