class PerformancesController < ApplicationController
  before_action :set_event
  before_action :set_performance, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    return redirect_to(@event)
  end

  def show
  end

  def new
    @performance = @event.performances.new
  end

  def edit
  end

  def create
    @performance = @event.performances.build(performance_params)

    if @performance.save
      redirect_to event_performance_path(@event, @performance), notice: "Performance was successfully created."
    else
      render :new
    end
  end

  def update
    if @performance.update(performance_params)
      redirect_to event_venue_path(@performance.event, @performance), notice: "Performance was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @performance.destroy
    redirect_to @event, notice: "Performance was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_performance
    @performance = @event.performances.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(
      :name,
      :description,
      :starts_at,
      :ends_at,
      :event_id,
      :user_id)
  end
end
