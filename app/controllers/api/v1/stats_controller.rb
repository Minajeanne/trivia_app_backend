class Api::V1::StatsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

 #  def index
 #    User.all.each do |user|
 #      Stat.create_or_update_user_stats(user)
 #
 #    end
 #    @stats = Stat.all.sort_by{ |s| s.user_rank }
 #
 #   render json: @stats
 # end

  def show
    @total_correct = @user.stat.total_correct
    user_pr = @total_correct

    @user_rank = @user.stat.user_rank
    user_rank = @user_rank


    # stat_json = StatSerializer.new(@stat).serialized_json
      # binding.pry
    render json: @total_correct

    # render json: @user.stat.total_correct
  end

  def update
      score = params[:score]
      @user = User.find_by(id: params[:id])
      if @user.stat.total_correct.nil? || score > @user.stat.total_correct
        @user.stat.update(total_correct: score)
      end
      render json: @user
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def stat_params
    params.require(:stat).permit(:user_id, :total_correct, :user_pr, :user_rank, :score, :id)
  end
end
