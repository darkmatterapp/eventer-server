class SessionsController < ApplicationController
  before_action :set_event
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @sessions = @event.sessions
  end

  def show
  end

  def new
    @session = @event.sessions.new
    @previous = @event
  end

  def edit
    @previous = [@event, @session]
  end

  def create
    @session = @event.sessions.build(session_params)

    if @session.save
      redirect_to [@event, @session], notice: "Session was successfully created."
    else
      render :new
    end
  end

  def update
    if @session.update(session_params)
      redirect_to [@event, @session], notice: "Session was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @session.destroy
    redirect_to @event, notice: "Session was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_session
    @session = @event.sessions.find(params[:id])
  end

  def session_params
    params.require(:session).permit(
      :name,
      :description,
      :starts_at,
      :ends_at,
      :event_id,
      :location_id,
      :user_id)
  end
end
