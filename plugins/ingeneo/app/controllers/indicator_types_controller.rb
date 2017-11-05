class IndicatorTypesController < ApplicationController
  def index
    @indicator_types = params[:subprocess_id].present? ? IndicatorType.where(subprocess_id: params[:subprocess_id]) : IndicatorType.all
  end
end
