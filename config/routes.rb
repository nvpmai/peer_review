Rails.application.routes.draw do
  namespace :admins do
    get '/', to: 'campaigns#index'
  end
end
