class HomeController < ApplicationController
  def index
    @data = Hash.new(0)
    (Item.where("current_quantity > 0").order(:name) || []).each do |asset|
      @data[asset.name] += asset.current_quantity
    end
  end

end
