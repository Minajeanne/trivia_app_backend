class Api::V1::StatsController < ApplicationController
  before_action :set_user, only: [:index, :show, :update]
  # before_action :set_stat, only: [:show, :update]

  def index
    binding.pry

    # User.all.each do |user|
    #   Stat.create_or_update_user_stats(user)

    # end
    # @stats = Stat.all.sort_by{ |s| s.user_rank }
    #
    # render json: @stats
 end

  def show
    @user = User.find_by(id: params[:id])
      # binding.pry
      # user_pr = @user.total_correct

    render json: @user.stat
    # render json: @total_correct
  end

  def update
      score = params[:score]
      @user = User.find_by(id: params[:id])
      if @user.stat.total_correct.nil? || score > @user.stat.total_correct
        @user.stat.update(total_correct: score)
      end
      render json: @user.stat
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  # def set_stat
  #   @stat = User.find_by(id: params[:id])
  # end

  def stat_params
    params.require(:stat).permit(:user_id, :total_correct, :user_pr, :user_rank, :score, :id)
  end
end
