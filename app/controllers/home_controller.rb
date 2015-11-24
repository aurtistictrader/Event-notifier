class HomeController < ApplicationController
  def index
    @event = Event.find(5)

    @sub_events = @event.sub_events
  end
end
