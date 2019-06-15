class Ingredient < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses
  has_many :reviews
  validates :name, presence: true, uniqueness: true
end
