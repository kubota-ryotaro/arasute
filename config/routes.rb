Rails.application.routes.draw do
  get 'maps/terms'
  get 'maps/contact'
  get 'maps/about'
  resources :maps
  root to: 'maps#index'
  get 'maps/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
