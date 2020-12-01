class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend1_user_friends, class_name: 'Friend', foreign_key: 'friend1_user_id', dependent: :destroy
  has_many :friend2_user_friends, class_name: 'Friend', foreign_key: 'friend2_user_id', dependent: :destroy

  has_many :collections, dependent: :destroy
  has_many :badges, through: :collections
  has_many :days, dependent: :destroy
  has_many :objectives, dependent: :destroy

  validates :first_name, :last_name, :nickname, :email, presence: true
  has_one_attached :photo
end
