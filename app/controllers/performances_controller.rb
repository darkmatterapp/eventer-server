class PerformancesController < ApplicationController
  before_action :set_event
  before_action :set_performance, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  def index
    @performances = @event.performances
  end

  def show
  end

  def new
    @performance = @event.performances.new
    @previous = @event
  end

  def edit
    @previous = [@event, @performance]
  end

  def create
    @performance = @event.performances.build(performance_params)

    if @performance.save
      # @performance.people << Person.find(params[:person])
      redirect_to [@event, @performance], notice: "Performance was successfully created."
    else
      render :new
    end
  end

  def update
    if @performance.update(performance_params)
      # @performance.people << Person.find(params[:person])
      redirect_to [@event, @performance], notice: "Performance was successfully updated."
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
      :location_id,
      :user_id)
  end
end
