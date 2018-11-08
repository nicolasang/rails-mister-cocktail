class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses #allows Cocktail to access ingredient using cocktail.ingredient.name, and not require cocktail.dose.ingredient.name

  validates :name, presence: true, uniqueness: true, allow_blank: false

end
