class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :craft_beers, dependent: :destroy
  has_many :craft_beer_reviews, dependent: :destroy
  
  def admin?
    role == "admin"
  end

end
