class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end
end
