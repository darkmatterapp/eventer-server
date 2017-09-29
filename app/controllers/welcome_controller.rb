class WelcomeController < ApplicationController
  def index
    return redirect_to(admin_events_path) if signed_in?

    render layout: false
  end
end
