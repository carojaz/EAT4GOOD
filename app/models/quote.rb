class Quote < ApplicationRecord
  validates :phrases, presence: true
end
