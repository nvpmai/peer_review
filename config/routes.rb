Rails.application.routes.draw do
  root 'campaigns#index'

  namespace :admins do
    get '/', to: 'campaigns#index'
    resources :campaigns do
      delete 'multiple_destroy', on: :collection

      member do
        post 'add_user'
        post 'close'
        post 'send_reminder'
        delete 'remove_users'
      end
    end
  end

  resources :campaigns, only: [] do
    member do
      get 'give_feedbacks'
      post 'update_feedback'
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
end
