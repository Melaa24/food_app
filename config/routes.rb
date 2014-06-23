FoodApp::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create]
  resources :console
  resources :contacts, only: [:new, :create]

  root 'static_pages#home'
  match '/about',      to: 'static_pages#about',    via: 'get'
  match '/workshop',   to: 'static_pages#workshop', via: 'get'
  match '/signup',     to: 'users#new',             via: 'get'
  match '/signin',     to: 'sessions#new',          via: 'get'
  match '/signout',    to: 'sessions#destroy',      via: 'delete'
end
