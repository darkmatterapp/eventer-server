class PeopleController < ApplicationController
  before_action :set_event
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(@event)
  end

  def show
  end

  def new
    @person = @event.people.new
  end

  def edit
  end

  def create
    @person = @event.people.build(person_params)

    if @person.save
      redirect_to [@event, @person], notice: "Person was successfully created."
    else
      render :new
    end
  end

  def update
    if @person.update(person_params)
      redirect_to [@event, @person], notice: "Person was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to @event, notice: "Person was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(
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
