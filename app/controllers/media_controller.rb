class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @media = current_user.media.where(type: medium_type)
  end

  def show
  end

  def new
    @medium = Medium.new(type: medium_type)
  end

  def edit
  end

  def create
    @medium = current_user.media.build(medium_params)

    if @medium.save
      redirect_to @medium, notice: "#{@medium.type} was successfully created."
    else
      render :new
    end
  end

  def update
    if @medium.update(medium_params)
      redirect_to @medium, notice: "#{@medium.type} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    type = @medium.type
    @medium.destroy
    redirect_to medium_namespace, notice: "#{type} was successfully destroyed."
  end

  private

  def medium_namespace
    "/" + medium_type.pluralize.downcase
  end
  helper_method :medium_namespace

  def medium_type
    request.path.split("/")[1].singularize.capitalize
  end
  helper_method :medium_type

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def medium_params
    params.require(:medium).permit(:type,
      :image_url,
      :instagram_url,
      :flickr_url,
      :facebook_url,
      :audio_url,
      :soundcloud_url,
      :video_url,
      :youtube_url,
      :vimeo_url,
      :vine_url,
      :title,
      :description,
      :creator_name,
      :creator_url,
      :published_at,
      :user_id)
  end
end
