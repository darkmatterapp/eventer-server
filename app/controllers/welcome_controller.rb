class WelcomeController < ApplicationController
  def index
    return redirect_to(dashboard_path) if signed_in?
  end
end
