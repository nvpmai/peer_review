module Admins
  class UsersController < BaseController
    def index
      @users = User.all.order(created_at: :desc).page(params[:page]).per(15)
    end

    def create
      user = User.new(user_params)
      if user.save
        redirect_back(fallback_location: '/admins/users')
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
  end
end
