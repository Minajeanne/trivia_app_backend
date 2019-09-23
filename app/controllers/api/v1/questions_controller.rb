class Api::V1::QuestionsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
end
