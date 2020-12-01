class Objective < ApplicationRecord
  belongs_to :user

  validates :veggies_days, inclusion: { in: (0..7) }
end
