class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.create
  end

  def show
    @event = Event.find(params[:id])
  end


  def create
    @event = Event.new(title: params[:title],
                        description: params[:description],
                        location: params[:location],
                        start_date: params[:start_date],
                        duration: params[:duration].to_i,
                        price: params[:price].to_i,
                        admin: current_user)
    if @event.save
      flash[:success] = "The event has been saved."
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

    def update
      @event = Event.update(title: params[:title],
                          description: params[:description],
                          location: params[:location],
                          start_date: params[:start_date],
                          duration: params[:duration].to_i,
                          price: params[:price].to_i,
                          admin: current_user)
      if @event.save
        flash[:success] = "The event has been modified."
        redirect_to @event
      else
        render 'new'
      end
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      flash[:success] = "The event has been deleted."
      redirect_to events_path
    end



  end
