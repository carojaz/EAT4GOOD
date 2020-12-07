class Objective < ApplicationRecord
  belongs_to :user

  validates :veggies_days, inclusion: { in: (0..21) }
  validates :nb_week, uniqueness: { scope: [:year, :user_id] }
end
