class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_island, only: %i[show edit update destroy]

  def index
    @islands = Island.all

    @markers = @islands.geocoded.map do |island|
      {
        lat: island.latitude,
        lng: island.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { island: island }),
        marker_html: render_to_string(partial: "marker", locals: {island: island})
      }
    end
  end

  def show
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user # Associates the current user to the island that gets created! This user is the OWNER
    if @island.save
      redirect_to island_path(@island)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @island.update(island_params)
      redirect_to island_path(@island), notice: "Island was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
      @island.destroy
      redirect_to islands_path, status: :see_other
  end

  private

  def set_island
    @island = Island.find(params[:id])
  end

  def island_params
    params.require(:island).permit(:title, :description, :address, :price_per_night, photos: [])
  end
end
