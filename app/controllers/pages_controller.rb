class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  
  def home
  end
end
