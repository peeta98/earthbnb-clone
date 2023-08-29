class IslandsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    def show
        @island = Island.find(params[:id])
    end
end
