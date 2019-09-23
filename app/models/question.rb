class Question < ApplicationRecord
  belongs_to :game
  has_many :users, through: :games
  # validates :answer, presence: true
end
