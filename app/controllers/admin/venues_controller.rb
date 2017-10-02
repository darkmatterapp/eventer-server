module Admin
  class VenuesController < Admin::AdminController
    before_action :set_event
    before_action :set_venue, only: [:show, :edit, :update, :destroy]

    def index
      @venues = @event.venues
    end

    def show
    end

    def new
      @venue = @event.venues.new
      @previous = [:admin, @event]
    end

    def edit
      @previous = [:admin, @event, @venue]
    end

    def create
      @venue = @event.venues.build(venue_params)

      if @venue.save
        redirect_to [:admin, @event, @venue], notice: "Venue was successfully created."
      else
        render :new
      end
    end

    def update
      if @venue.update(venue_params)
        redirect_to [:admin, @event, @venue], notice: "Venue was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @venue.destroy
      redirect_to [:admin, @event], notice: "Venue was successfully destroyed."
    end

    private

    def set_venue
      @venue = @event.venues.find(params[:venue_id])
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
        :facebook
      )
    end
  end
end
