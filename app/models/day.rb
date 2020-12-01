class Day < ApplicationRecord
  belongs_to :user
  belongs_to :breakfast
  belongs_to :lunch
  belongs_to :dinner
  belongs_to :status
  belongs_to :week

  validates :date, presence: true
end
