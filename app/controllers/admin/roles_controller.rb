module Admin
  class RolesController < Admin::AdminController
    before_action :set_event
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    def index
      @roles = @event.roles
    end

    def show
    end

    def new
      @role = @event.roles.new
      @previous = [:admin, @event]
    end

    def edit
      @previous = [:admin, @event, @role]
    end

    def create
      @role = @event.roles.build(role_params)

      if @role.save
        redirect_to [:admin, @event, @role], notice: "Role was successfully created."
      else
        render :new
      end
    end

    def update
      if @role.update(role_params)
        redirect_to [:admin, @event, @role], notice: "Role was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @role.destroy
      redirect_to [:admin, @event], notice: "Role was successfully destroyed."
    end

    private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_role
      @role = @event.roles.find(params[:id])
    end

    def role_params
      params.require(:role).permit(
        :name,
        :event_id,
        :description
      )
    end
  end
end
