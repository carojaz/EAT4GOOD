class Week < ApplicationRecord
  has_many :days, dependent: :destroy

  validates :week_nb, :year, presence: true
  validates :week_nb, inclusion: { in: (1..53) }
end
