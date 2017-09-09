class CraftBeerReview < ApplicationRecord
  belongs_to :user
  belongs_to :craft_beer
end
