class Api::V1::StatsController < ApplicationController
  before_action :set_user, only: [:index, :show, :update, :destroy]

  def index
    User.all.each do |user|
      Stat.create_or_update_user_stats(user)
    end
    @stats = Stat.all.sort_by{ |s| s.user_rank }

   render json: @stats
 end

  def show
    render json: @user.stat
  end

  def update
    # byebug
      score = params[:score]
      @user = User.find_by(id: params[:id])
        binding.pry
      if score > @user.stat.total_correct || @user.stat.total_correct.nil?
        @user.stat.update(total_correct: score)
      end
      render json: @user.stat
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def stat_params
    params.require(:stat).permit(:user_id, :total_correct, :user_pr, :user_rank, :score)
  end
end
