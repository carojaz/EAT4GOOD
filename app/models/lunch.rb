class Lunch < ApplicationRecord
  belongs_to :foodtype
  has_many :days, dependent: :destroy
end
