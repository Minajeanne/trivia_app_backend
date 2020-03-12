class Api::V1::StatsController < ApplicationController
  before_action :set_user, only: [:index, :show, :update]

  def index
    @stats = Stat.all
    @users_rankings = Stat.create_or_update_user_rank

    render json: @users_rankings.as_json(
      only: [:user_id, :total_correct, :user_pr, :user_rank],
      include: { user: { only: [:username] } }
    )
 end

  def show
    @user = User.find_by(id: params[:id])

    render json: @user.stat
  end

  def update
      score = params[:score]
      high_score = user.stat.total_correct
      @user = User.find_by(id: params[:id])
      if @user.stat.total_correct.nil? || score > @user.stat.total_correct
        @user.stat.update(total_correct: score, user_pr: high_score)
      end
      render json: @user.stat
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def stat_params
    params.require(:stat).permit(:user_id, :total_correct, :user_pr, :user_rank, :score, :id)
  end
end
