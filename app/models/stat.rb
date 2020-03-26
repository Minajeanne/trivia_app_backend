class Stat < ApplicationRecord
  belongs_to :user

  def self.create_or_update_user_rank
    filter_nil = Stat.all.select { |s| s[:total_correct] != nil }
      assign_rank = filter_nil.sort_by { |s| s[:total_correct] }.reverse
        assign_rank.each_with_index do |stat, index|
          user_rank = index + 1
          stat.update(user_rank: user_rank)
        end
  end
end
