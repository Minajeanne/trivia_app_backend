class Api::V1::GamesController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
end
