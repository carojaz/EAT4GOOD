class Day < ApplicationRecord
  belongs_to :user
  belongs_to :breakfast
  belongs_to :lunch
  belongs_to :dinner

  validates :date, presence: true
end
