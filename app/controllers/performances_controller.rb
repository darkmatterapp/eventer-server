class PerformancesController < ApplicationController
  before_action :set_performance, only: [:show, :edit, :update, :destroy]

  def index
    @performances = Performance.all
  end

  def show
  end

  def new
    @performance = Performance.new
  end

  def edit
  end

  def create
    @performance = current_user.performances.build(performance_params)

    if @performance.save
      redirect_to @performance, notice: 'Performance was successfully created.'
    else
      render :new
    end
  end

  def update
    if @performance.update(performance_params)
      redirect_to @performance, notice: 'Performance was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @performance.destroy
    redirect_to performances_path, notice: 'Performance was successfully destroyed.'
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(
      :name,
      :description,
      :event_id,
      :user_id)
  end
end
