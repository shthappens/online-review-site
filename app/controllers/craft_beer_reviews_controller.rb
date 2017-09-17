class CraftBeerReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @craft_beer_review = CraftBeerReview.new
  end

  def create

    if @craft_beer.nil?
      @craft_beer = CraftBeer.new(craft_beer_params)
    end

    @craft_beer_review = CraftBeerReview.new(craft_beer_review_params)
    @craft_beer_review.user = current_user
    # binding.pry

    respond_to do |format|
      if @craft_beer_review.save
        format.html { redirect_to @craft_beer_review, notice: 'Craft Beer Review was successfully created.' }
        format.json { render :show, status: :created, location: @craft_beer_review  }
      else
        format.html { render :new }
        format.json { render json: @craft_beer_review .errors, status: :unprocessable_entity }
      end
    end
  end

  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_path, notice: "You must be logged in."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_craft_beer_review
      @craft_beer_review = CraftBeerReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def craft_beer_params
      params.require(:craft_beer_review).permit(:name, :brewery, :description)
    end

    def craft_beer_review_params
      params.require(:craft_beer_review).permit(:description, :rating)
    end

end
