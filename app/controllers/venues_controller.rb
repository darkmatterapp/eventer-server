class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(dashboard_path)
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = current_user.venues.build(venue_params)

    if @venue.save
      redirect_to @venue, notice: "Venue was successfully created."
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: "Venue was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, notice: "Venue was successfully destroyed."
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
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
