class Challengeset < ApplicationRecord
  belongs_to :challenge
  belongs_to :friend

  validates :start_date, presence: true
end
