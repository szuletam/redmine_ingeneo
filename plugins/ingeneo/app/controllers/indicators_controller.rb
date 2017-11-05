class IndicatorsController < ApplicationController

  def index
  end

  def new
    @indicator = Indicator.new
  end

end