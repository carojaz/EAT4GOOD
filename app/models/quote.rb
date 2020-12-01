class Quote < ApplicationRecord
  validates :phrase, presence: true
end
