class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :user_time_zone, if: :current_event

  private

  def signed_in?
    current_user
  end
  helper_method :signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to signin_path, alert: "Not authorized" unless signed_in?
  end

  def user_time_zone(&block)
    Time.use_zone(current_event.time_zone, &block)
  end

  # TODO memoize this before we start getting hammered
  def current_event
    if params[:event_id]
      Event.find(params[:event_id])
    end
  end
end
