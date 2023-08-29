class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end
  def edit
    @island = Island.find(params[:id])
  end
  def update
    @island = Island.find(params[:id])
    if @island.update(island_params)
      redirect_to island_path(@island), notice: "Island was successfully updated"
    else 
      render :edit, status: :unprocessable_entity
    end
  end
  private
  def island_params
    params.require(:island).permit(:title, :address, :description, :price_per_night )
  end
end
