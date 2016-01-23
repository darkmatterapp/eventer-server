class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(dashboard_path)
  end

  def show
  end

  def new
    @medium = Medium.new
  end

  def edit
  end

  def create
    @medium = current_user.media.build(medium_params)
    @medium.type = media_type

    if @medium.save
      redirect_to @medium, notice: "Medium was successfully created."
    else
      render :new
    end
  end

  def update
    if @medium.update(medium_params)
      redirect_to @medium, notice: "Medium was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @medium.destroy
    redirect_to media_path, notice: "Medium was successfully destroyed."
  end

  private

  def media_path
    "/" + request.path.split("/")[1]
  end
  helper_method :media_path

  def media_type
    media_path.singularize.capitalize
  end
  helper_method :media_type

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def medium_params
    params.require(:medium).permit(:image_path,
      :instagram_path,
      :flick_path,
      :facebook_path,
      :audio_path,
      :soundcloud_path,
      :video_path,
      :youtube_path,
      :vimeo_path,
      :title,
      :description,
      :creator_name,
      :creator_path,
      :published_at,
      :user_id)
  end
end
