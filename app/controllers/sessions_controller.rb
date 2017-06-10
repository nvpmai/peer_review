class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = 'Invalid account info. Please try again'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
