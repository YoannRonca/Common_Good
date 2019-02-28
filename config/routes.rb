Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'missions#index'

  # resources :associations do
  #   resources :missions do
  #     resources :reviews, only: [:new, :create]
  #   end
  # end

  get '/search', to: 'missions#search', as: 'search'

  resources :organizations do
    resources :missions, only: [:new, :create]
  end
  resources :missions, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
  end
  resource :users, only: :show
  resources :profiles, only: :show
end
