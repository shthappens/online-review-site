class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all.order(email: :asc)
      @craft_beers = CraftBeer.all.order(name: :asc)
      @craft_beer_reviews = CraftBeerReview.all.order(created_at: :desc)
    else
      redirect_to "/craft_beers"
    end
  end
end
