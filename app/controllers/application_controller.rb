class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to '/sessions/new' unless current_user
  end

  def execute
    render_response(find_and_create_service.execute)
  end

  private
  def find_and_create_service
    clazz = "#{find_module}::#{find_action}".constantize
    clazz.new(params, current_user)
  end

  def find_module
    controller_name.camelize
  end

  def find_action
    action_name.camelize
  end

  def render_response(data)
    respond_to do |format|
      format.html { @result = data }
      format.js { @result = data }
    end
  end
end
