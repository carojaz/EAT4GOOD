class Foodtype < ApplicationRecord
  has_many :breakfasts
  has_many :lunches
  has_many :dinners
end
