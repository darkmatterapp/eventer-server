class VenuesController < ApplicationController
  before_action :set_event
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(@event)
  end

  def show
  end

  def new
    @venue = @event.venues.new
  end

  def edit
  end

  def create
    @venue = @event.venues.build(venue_params)

    if @venue.save
      redirect_to event_venue_path(@event, @venue), notice: "Venue was successfully created."
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to @event, notice: "Venue was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to @event, notice: "Venue was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_venue
    @venue = @event.venues.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(
      :name,
      :nickname,
      :street_address,
      :extended_address,
      :locality,
      :region,
      :postal_code,
      :country,
      :phone,
      :url,
      :latitude,
      :longitude,
      :altitude,
      :twitter,
      :instagram,
      :facebook)
  end
end
