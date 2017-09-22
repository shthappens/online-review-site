class CraftBeerReview < ApplicationRecord
  belongs_to :user
  belongs_to :craft_beer

  validates :rating, presence: true, :numericality => {:greater_than_or_equal_to => 1, :less_than => 7}
  validates :description, presence: true, allow_blank: false
end
