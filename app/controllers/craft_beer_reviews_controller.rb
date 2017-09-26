class CraftBeerReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @craft_beer = CraftBeer.find(params[:craft_beer_id])
    @craft_beer_review = CraftBeerReview.find(params[:id])
  end

  def new
    @craft_beer_review = CraftBeerReview.new
    @craft_beer = CraftBeer.find(params[:craft_beer_id])
  end

  def update
    @craft_beer_review = CraftBeerReview.find(params[:id])
    if @craft_beer_review.update(craft_beer_review_params)
      redirect_to craft_beers_path, notice: "Craft Beer review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @craft_beer_review = CraftBeerReview.find(params[:id])
    @craft_beer_review.delete
    redirect_to craft_beers_path
    flash[:notice] = "Craft Beer review was successfully deleted."
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
      params.require(:craft_beer_review).permit(:description, :rating, :craft_beer_id)
    end

end
