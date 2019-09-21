class Question < ApplicationRecord
  belongs_to :game
  validates :answer, presence: true
end
