Rails.application.routes.draw do

  get 'craft_beer/index'

  root "craft_beer#index"

  resources :craft_beers, :craft_beer_reviews

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
