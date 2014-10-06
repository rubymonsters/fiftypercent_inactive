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

  def edit
    @event = Event.find(params[:id])
  end  

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end     
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
