class User < ApplicationRecord
  has_secure_password

  has_many :games
  belongs_to :stat
  has_many :questions, through: :games

  validates :username, presence: true
  validates :username, uniqueness: true
end
