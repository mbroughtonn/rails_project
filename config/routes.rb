Rails.application.routes.draw do
  resources :pages, except: [:show]
  get "pages/:permalink" => "pages#permalink", as: :page_permalink
  root to: "home#index"
  resources :games, only: [ :index, :show ]
  resources :publishers, only: [ :index, :show ]
  resources :consoles, only: [ :index, :show ]

  get '/search', to: 'search#index', as: 'search'

  get "up" => "rails/health#show", as: :rails_health_check

end
