module Admin
  class AuthsController < Admin::AdminController
    skip_before_action :authorize

    # /signin
    def new
      @slug = "signin"
      # TODO: why doesn't this prevent a signed in user going to /signin
      return redirect_to(admin_events_path) if signed_in?
    end

    # /signin
    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admin_events_path, notice: "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end

    # /signout
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end
end
