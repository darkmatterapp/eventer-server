class LinksController < ApplicationController
  before_action :set_event
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(@event)
  end

  def show
  end

  def new
    @link = @event.links.new
  end

  def edit
  end

  def create
    @link = @event.links.build(link_params)

    if @link.save
      redirect_to [@event, @link], notice: "Link was successfully created."
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to [@event, @link], notice: "Link was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to @event, notice: "Link was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_link
    @link = @event.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url,
      :title,
      :content,
      :creator_name,
      :creator_url,
      :author_photo,
      :published_at,
      :user_id)
  end
end
