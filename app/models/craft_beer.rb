class CraftBeer < ApplicationRecord
  belongs_to :user
  has_many :craft_beer_reviews
end
