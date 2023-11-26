# Rails.application.routes.draw do
#   resources :categories

#   devise_for :admin_users, ActiveAdmin::Devise.config
#   ActiveAdmin.routes(self)

#   devise_for :patients
#   devise_for :doctors

#   resources :patients, only: [:index, :show]
#   resources :doctors, only: [:index, :show]

#   root to: "home#index"

#   resources :patients, only: [:index, :show]

#   resources :doctors do
#     resources :appointments, only: [:new, :create, :show]
#   end

#   resources :appointments do
#     collection do
#       get :closed_appointments
#     end
#   end


#   resources :appointments, only: [:new, :create, :show, :index] do
#     resources :recommendations, only: [:new, :create]
#   end


#   resources :appointments do
#     member do
#       put 'close'
#     end
#   end

#   resources :appointments do
#     member do
#       put :close
#     end
#   end

# end


Rails.application.routes.draw do
  resources :categories

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :patients
  devise_for :doctors

  resources :patients, only: [:index, :show]
  resources :doctors, only: [:index, :show] do
    resources :appointments, only: [:new, :create, :show]
  end

  root to: "home#index"

  resources :appointments do
    collection do
      get :closed_appointments
    end

    member do
      put :close
    end

    resources :recommendations, only: [:new, :create]
  end
end
