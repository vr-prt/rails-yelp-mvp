class Restaurant < ApplicationRecord
  RESTAURANT_CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: RESTAURANT_CATEGORIES

  has_many :reviews, dependent: :destroy
end
