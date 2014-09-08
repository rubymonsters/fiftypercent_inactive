class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to @event
    else
      render :new
    end  
  end  
  
  def event_params
    params.require(:event).permit(:name)
  end
end
