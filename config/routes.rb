Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "application#home"

   resources :users, only: [:new, :show] do
  #   # nested resource for orders
    resources :orders, only: [:show, :index]
   end
  resources :users #, except: :show
  resources :meals
  resources :orders
  resources :ingredients

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/add_meal', to: 'orders#add_meal'
  # get '/order_page', to: 'users#order_page'
  get'/checkout', to: 'orders#checkout'
end
