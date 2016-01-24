class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(dashboard_path)
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = current_user.people.build(person_params)

    if @person.save
      redirect_to @person, notice: "Person was successfully created."
    else
      render :new
    end
  end

  def update
    if @person.update(person_params)
      redirect_to @person, notice: "Person was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path, notice: "Person was successfully destroyed."
  end

  private

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
