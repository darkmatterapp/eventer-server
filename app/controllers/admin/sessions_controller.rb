module Admin
  class SessionsController < Admin::AdminController
    before_action :set_event
    before_action :set_session, only: [:show, :edit, :update, :destroy]

    def index
      @sessions = @event.sessions
    end

    def show
    end

    def new
      @session = @event.sessions.new
      @previous = [:admin, @event]
    end

    def edit
      @session.starts_at = @session.starts_at.strftime("%F %R")
      @session.ends_at = @session.ends_at.strftime("%F %R")
      @previous = [:admin, @event, @session]
    end

    def create
      @session = @event.sessions.build(session_params)

      if @session.save
        redirect_to [:admin, @event, @session], notice: "Session was successfully created."
      else
        render :new
      end
    end

    def update
      if @session.update(session_params)
        redirect_to [:admin, @event, @session], notice: "Session was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @session.destroy
      redirect_to [:admin, @event], notice: "Session was successfully destroyed."
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
        :user_id
      )
    end
  end
end
