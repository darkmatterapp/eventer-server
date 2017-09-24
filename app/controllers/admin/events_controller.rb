module Admin
  class EventsController < Admin::AdminController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
      @events = current_user.events
    end

    def show
    end

    def new
      @event = Event.new
      @previous = dashboard_path
    end

    def edit
      @previous = [:admin, @event]
    end

    def create
      @event = current_user.events.build(event_params)

      if @event.save
        redirect_to [:admin, @event], notice: "Event was successfully created."
      else
        render :new
      end
    end

    def update
      if @event.update(event_params)
        redirect_to [:admin, @event], notice: "Event was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path, notice: "Event was successfully destroyed."
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :name,
        :start_date,
        :end_date,
        :time_zone,
        :code_of_conduct,
        :user_id
      )
    end
  end
end
