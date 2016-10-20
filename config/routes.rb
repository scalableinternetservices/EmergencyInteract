Rails.application.routes.draw do
  get '/home',	to: 'static_pages#home'

  get '/help',	to: 'static_pages#help'

  resources :events do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
end
