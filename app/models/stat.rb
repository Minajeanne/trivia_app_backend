class Stat < ApplicationRecord
  belongs_to :user

  # *****FIX ALL THIS*****

  # def self.user_rank(user_pr)
  #   new_rank = Streak.ranked_streak
  #   return new_ranked_streaks.index(streak.streak_count) + 1
  # end

  def self.create_or_update_user_stats(user)
    user_pr = Streak.find_user_longest_streak(user)
    total_correct = user.attempts.select{|a| a.right_answer == 4 }.length
    rank = Stat.user_rank(longest_streak)

    if !user.stat
        @stat = Stat.new(user_id: user.id, user_pr: user_pr.streak_count, total_correct: total_correct, rank: rank)
        if @stat.valid?
            @stat.save
        end
    else
        user.stat.update_attributes(user_pr: user_pr, total_correct: total_correct, rank: rank)
    end
  end
end
