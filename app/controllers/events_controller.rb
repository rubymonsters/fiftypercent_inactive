class EventsController < ApplicationController
  #http_basic_authenticate_with username: "Frog", password: "froggy", except: [:index, :show]
  before_filter :authenticate, except: [:index, :show]
  
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
      #redirect_to "/events/#{@event.id}"
      #redirect_to event_path(@event.id)
      #redirect_to event_path(@event)
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :action =>"index"
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :date, :organizer, :organizer_url, :number_of_women, :percentage_of_women)
  end

protected

def authenticate
  authenticate_or_request_with_http_basic do |username, password|
    username == "Frog" && password == "froggy"
  end
end

end
