class ParticipationsController < ApplicationController
  before_action :set_event
  before_action :set_participation, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @participations = @event.participations
  end

  def show
    redirect_to [@event, :participations]
  end

  def new
    @participation = @event.participations.new
    @previous = @event
  end

  def edit
    @previous = [@event, @participation]
  end

  def create
    @participation = @event.participations.build(participation_params)

    if @participation.save
      redirect_to [@event, :participations], notice: "Participation was successfully created."
    else
      render :new
    end
  end

  def update
    if @participation.update(participation_params)
      redirect_to [@event, :participations], notice: "Participation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @participation.destroy
    redirect_to [@event, :participations], notice: "Participation was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_participation
    @participation = @event.participations.find(params[:id])
  end

  def participation_params
    params.require(:participation).permit(:performance_id,
      :person_id,
      :participation_id,
      :event_id)
  end
end
