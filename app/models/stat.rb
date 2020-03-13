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
  # end

    # top_five = ranking[0..5]

  # end

  # def self.create_or_update_user_stats(user)
  #   user_pr = Streak.find_user_longest_streak(user)
  #   total_correct = user.attempts.select{|a| a.right_answer == 4 }.length
  #   rank = Stat.user_rank(longest_streak)
  #
  #   if !user.stat
  #       @stat = Stat.new(user_id: user.id, user_pr: user_pr.streak_count, total_correct: total_correct, rank: rank)
  #       if @stat.valid?
  #           @stat.save
  #       end
  #   else
  #       user.stat.update_attributes(user_pr: user_pr, total_correct: total_correct, rank: rank)
  #   end
  # end
end
