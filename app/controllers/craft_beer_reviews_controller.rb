class CraftBeerReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @craft_beer_review = CraftBeerReview.new
    @craft_beer = CraftBeer.find(params[:craft_beer_id])
  end

  def create
    @craft_beer_review = CraftBeerReview.new(craft_beer_review_params)
    @craft_beer = CraftBeer.find(params[:craft_beer_id])
    @craft_beer_review.craft_beer = @craft_beer
    @user = current_user
    @craft_beer_review.user = @user

    if @craft_beer_review.save
      flash[:notice] = "Review saved!"
      redirect_to craft_beer_path(@craft_beer)
    else
      flash[:errors] = "Review didn't save :-("
      render :new
    end
  end

  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_path, notice: "You must be logged in."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.

    def craft_beer_review_params
      params.require(:craft_beer_review).permit(:description, :rating)
    end

end
