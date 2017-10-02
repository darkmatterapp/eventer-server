class WelcomeController < ApplicationController
  def index
    return redirect_to(admin_events_path) if signed_in?

    render layout: false
  end

  def demo
    user = User.find_by(email: "test@example.com")
    session[:user_id] = user.id
    return redirect_to admin_event_path(user.events.first)
  end
end
