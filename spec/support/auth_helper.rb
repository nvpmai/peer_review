module AuthHelper
  def http_login
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'secret')
  end

  def login(user)
    request.session[:user_id] = user.id
  end
end
