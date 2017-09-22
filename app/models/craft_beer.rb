class CraftBeer < ApplicationRecord
  belongs_to :user
  has_many :craft_beer_reviews
  has_many :users, through: :craft_beer_reviews

  validates :name, presence: true, allow_blank: false
  validates :brewery, presence: true, allow_blank: false
  validates :craft_beer_type, presence:true, allow_blank: false
end
