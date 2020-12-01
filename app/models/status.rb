class Status < ApplicationRecord
  has_many :days, dependent: :destroy
end
