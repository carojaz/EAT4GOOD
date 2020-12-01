class Friend < ApplicationRecord
  belongs_to :friend1_user, class_name: 'User'
  belongs_to :friend2_user, class_name: 'User'
  has_many :challengesets, dependent: :destroy
  has_many :challenges, through: :challengesets

  validates :friend1_user, uniqueness: { scope: :friend2_user, message: "you are already friends" }
  validates :status, inclusion: { in: ['pending', 'OK', 'KO'] }
end
