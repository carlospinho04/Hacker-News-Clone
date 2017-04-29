Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'articles#index'

  get 'up' => 'articles#up'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/cool' => 'gif#cool'
  get '/sweet' => 'gif#sweet'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/teste' => 'users#teste'
  post'/resets' => 'users#edit'


end
