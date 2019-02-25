Rails.application.routes.draw do
  devise_for :users
  root to: 'missions#index'

  # resources :associations do
  #   resources :missions do
  #     resources :reviews, only: [:new, :create]
  #   end
  # end

  resources :associations do
    resources :missions, only: [:new, :create]
  end
  resources :missions, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end
  resource :dashboard, only: :show
end
