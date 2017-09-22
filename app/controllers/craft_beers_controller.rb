class CraftBeersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @craft_beers = CraftBeer.all
  end

  def new
    @craft_beer = CraftBeer.new
  end

  def show
    @craft_beer = CraftBeer.find(params[:id])
  end

  # POST /craft_beers
  def create
    @craft_beer = CraftBeer.new(craft_beer_params)
    @craft_beer.user = current_user

    if @craft_beer.save
      redirect_to root_path,
      notice: 'Craft Beer was successfully created.'
    else
      render :new
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def craft_beer_params
    params.required(:craft_beer).permit(:name, :brewery, :craft_beer_type)
  end

end
