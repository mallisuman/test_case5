Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/users/dash_board' => 'users#dash_board'

  # post '/users/:id/dash_board', to: 'users#dash_board'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users


  resources :products

  resources :categories

end
