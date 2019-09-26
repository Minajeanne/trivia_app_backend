class User < ApplicationRecord
  has_secure_password

  has_many :games
  has_many :stats
  has_many :questions, through: :games

end
