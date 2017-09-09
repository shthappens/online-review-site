class CraftBeerController < ApplicationController
  def index
    @reviews = CraftBeerReview.all
  end
end
