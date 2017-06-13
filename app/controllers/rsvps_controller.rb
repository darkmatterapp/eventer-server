class RsvpsController < ApplicationController
  before_action :set_event
  before_action :set_rsvp, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @rsvps = @event.rsvps
  end

  def show
    redirect_to [@event, :rsvps]
  end

  def new
    @rsvp = @event.rsvps.new
    @previous = @event
  end

  def edit
    @previous = [@event, @rsvp]
  end

  def create
    @rsvp = @event.rsvps.build(rsvp_params)
    @person = Person.create!(params[:person_id])

    if @rsvp.save
      redirect_to [@event, :rsvps], notice: "RSVP was successfully created."
    else
      render :new
    end
  end

  def update
    if @rsvp.update(rsvp_params)
      redirect_to [@event, :rsvps], notice: "RSVP was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @rsvp.destroy
    redirect_to [@event, :rsvps], notice: "RSVP was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_rsvp
    @rsvp = @event.rsvps.find(params[:id])
  end

  def rsvp_params
    params.require(:rsvp).permit(:person_id,
      :attending,
      :content,
      :event_id,
      person_attributes: [
        :name,
        :photo,
        :bio,
        :url,
        :twitter,
        :instagram,
        :facebook,
        :youtube,
        :vimeo,
        :bandcamp,
        :user_id
      ])
  end
end
