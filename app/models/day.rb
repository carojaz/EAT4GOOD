class Day < ApplicationRecord
  belongs_to :user
  belongs_to :breakfast
  belongs_to :lunch
  belongs_to :dinner

  validates :date, presence: true

  def veggie_per_day
    result = 0
    result += 1 if breakfast.foodtype.name == "Veggie"
    result += 1 if lunch.foodtype.name == "Veggie"
    result += 1 if dinner.foodtype.name == "Veggie"
    result
  end
end
