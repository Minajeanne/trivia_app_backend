class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

# GET /trips
def index
  if logged_in?
    @games = current_user.games

    render json: GameSerializer.new(@games)
  else
    render json: {
      error: "You must be logged in to see your games"
    }
  end
end

# GET /trips/1
def show
  render json: @game
end

# POST /trips
def create
  # byebug
  @game = current_user.games.build(game_params)

  if @game.save
    render json:  GameSerializer.new(@game), status: :created
  else
    error_resp = {
      error: @game.errors.full_messages.to_sentence
    }
    render json: error_resp, status: :unprocessable_entity
  end
end

# PATCH/PUT /trips/1
def update
  if @game.update(game_params)
    render json:  GameSerializer.new(@game), status: :ok
  else
    error_resp = {
      error: @game.errors.full_messages.to_sentence
    }
    render json: error_resp, status: :unprocessable_entity
  end
end

# DELETE /trips/1
def destroy
  if @game.destroy
    render json:  { data: "Game successfully deleted" }, status: :ok
  else
    error_resp = {
      error: "Game not found and not deleted"
    }
    render json: error_resp, status: :unprocessable_entity
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.require(:game).permit(:user_id)
  end
end
