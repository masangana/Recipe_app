class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy, class_name: 'RecipeFood'

  validates :name, :description, :prepation_time, :cooking_time, presence: true
end
