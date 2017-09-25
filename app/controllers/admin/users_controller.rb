module Admin
  class UsersController < Admin::AdminController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorize, only: [:new, :create]

    def index
      return redirect_to(admin_events_path)
    end

    # /signup
    def new
      @slug = "signup"

      if signed_in?
        return redirect_to root_path
      else
        @user = User.new
      end
    end

    # /signup
    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to admin_events_path, notice: "Thank you for signing up!"
      else
        render "new"
      end
    end

    # /settings
    def edit
      @slug = "settings"
    end

    # /settings
    def update
      if current_user.update(user_params)
        redirect_to admin_events_path, notice: "Your settings were successfully updated."
      else
        render action: "edit"
      end
    end

    def destroy
      @user.destroy
      redirect_to root_path, notice: "Your account was deleted. Sorry to see you go. We hope you find what you're looking for."
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(
        :email,
        :phone,
        :password,
        :password_confirmation,
        :avatar,
        :name,
        :url
      )
    end
  end
end
