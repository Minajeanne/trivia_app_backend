class Api::V1::StatsController < ApplicationController
  before_action :set_user, only: [:index, :show, :destroy]

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

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def stat_params
    params.require(:stat).permit(:user_id, :total_correct, :user_pr, :user_rank)
  end
end
