Rails.application.routes.draw do
  namespace :admins do
    get '/', to: 'campaigns#index'
    resources :campaigns do
      delete 'multiple_destroy', on: :collection

      member do
        post 'add_user'
        delete 'remove_users'
      end
    end
  end
end
