class HomeController < ApplicationController
  def index
    @total_registered_assets = 0
    @total_available_assets = 0 
    @total_missing_assets = 0
  end
end
