Rails.application.routes.draw do

  # get 'craft_beers/index'

  root "craft_beers#index"

  resources :craft_beers do
    resources :craft_beer_reviews
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
