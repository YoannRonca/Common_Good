class SectorsController < ApplicationController
  def index
    @sectors = Sector.all
  end

  def show
    @sector = Sector.find
  end
end
