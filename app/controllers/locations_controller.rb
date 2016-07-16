class LocationsController < ApplicationController
  before_action :set_event
  before_action :set_venue
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to([@event, @venue])
  end

  def show
  end

  def new
    @location = @venue.locations.new
    @previous = [@event, @venue]
  end

  def edit
    @previous = @location
    @previous = [@event, @venue, @location]
  end

  def create
    @location = @venue.locations.build(location_params)

    if @location.save
      redirect_to [@event, @venue, @location], notice: "Location was successfully created."
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to [@event, @venue], notice: "Location was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to [@event, @venue], notice: "Location was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_venue
    @venue = @event.venues.find(params[:venue_id])
  end

  def set_location
    @location = @venue.locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(
      :name,
      :venue_id,
      :user_id)
  end
end
