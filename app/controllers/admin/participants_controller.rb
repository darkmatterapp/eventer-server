module Admin
  class ParticipantsController < Admin::AdminController
    before_action :set_event
    before_action :set_participant, only: [:show, :edit, :update, :destroy]

    def index
      @participants = @event.participants
    end

    def show
    end

    def new
      @participant = @event.participants.new
      @previous = [:admin, @event]
    end

    def edit
      @previous = [:admin, @event, @participant]
    end

    def create
      @participant = @event.participants.build(participant_params)

      if @participant.save
        redirect_to [:admin, @event, @participant], notice: "Participant was successfully created."
      else
        render :new
      end
    end

    def update
      if @participant.update(participant_params)
        redirect_to [:admin, @event, @participant], notice: "Participant was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @participant.destroy
      redirect_to [:admin, @event], notice: "Participant was successfully destroyed."
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
        :user_id
      )
    end
  end
end
