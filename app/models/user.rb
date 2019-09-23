class User < ApplicationRecord
  has_many :games
  has_many :questions, through: :games
  has_secure_password
end
