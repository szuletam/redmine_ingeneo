class IndicatorLevelsController < ApplicationController
  def index
    @indicator_levels = params[:indicator_type_id].present? ? IndicatorLevel.where(indicator_type_id: params[:indicator_type_id]) : IndicatorLevel.all
  end
end
