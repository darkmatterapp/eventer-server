class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(dashboard_path)
  end

  def show
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to @link, notice: "Link was successfully created."
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: "Link was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: "Link was successfully destroyed."
  end

  private

  def set_link
    @link = Link.find(params[:id])
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
