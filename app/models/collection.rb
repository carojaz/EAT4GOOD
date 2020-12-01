class Collection < ApplicationRecord
  # collection est la consultation entre user et badge
  belongs_to :badge
  belongs_to :user
end
