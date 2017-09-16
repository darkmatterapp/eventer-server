class ParticipantsController < ApplicationController
  before_action :set_event
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @participants = @event.participants
  end

  def show
  end

  def new
    @participant = @event.participants.new
    @previous = @event
  end

  def edit
    @previous = [@event, @participant]
  end

  def create
    @participant = @event.participants.build(participant_params)

    if @participant.save
      redirect_to [@event, @participant], notice: "Participant was successfully created."
    else
      render :new
    end
  end

  def update
    if @participant.update(participant_params)
      redirect_to [@event, @participant], notice: "Participant was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @participant.destroy
    redirect_to @event, notice: "Participant was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(
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
      :user_id)
  end
end
