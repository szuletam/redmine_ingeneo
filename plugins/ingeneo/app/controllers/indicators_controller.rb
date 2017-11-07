class IndicatorsController < ApplicationController

  def index
    @indicators = Indicator.all
    if params[:search]
      search = params[:search]
      data = {
          indicator_type_id: search[:indicator_type_id],
          year_id: search[:year_id],
          month_id: search[:month_id]
      }
      @indicators = Indicator.where(data)
    else
      @indicators = Indicator.all
    end

  end

  def new
    @indicator = Indicator.new
  end

  def show
  end

  def create
    @indicator = Indicator.new(indicator_params)
    @indicator.date = DateTime.now
    if @indicator.save
      respond_to do |format|
        format.api  { render :action => 'show', :id => @indicator.id }
      end
    else
      respond_to do |format|
        format.api  { render_validation_errors(@indicator) }
      end
    end
  end

  def update
    @indicator = Indicator.find(params[:id])
    @indicator.attributes = indicator_params
    if @indicator.save
      respond_to do |format|
        format.api  { render :action => 'show', :id => @indicator.id }
      end
    else
      respond_to do |format|
        format.api  { render_validation_errors(@indicator) }
      end
    end
  end


  def form
    if Indicator.exists?(
       indicator_type_id: params[:indicator_type_id],
       indicator_level_id: params[:indicator_level_id],
       year_id: params[:year_id],
       month_id: params[:month_id],
       week_id: params[:week_id],
       service_id: params[:service_id],
       subservice_id: params[:subservice_id],
       application_id: params[:application_id],
       app_module_id: params[:app_module_id],
    )
      @indicator = Indicator.where(
          indicator_type_id: params[:indicator_type_id],
          indicator_level_id: params[:indicator_level_id],
          year_id: params[:year_id],
          month_id: params[:month_id],
          week_id: params[:week_id],
          service_id: params[:service_id],
          subservice_id: params[:subservice_id],
          application_id: params[:application_id],
          app_module_id: params[:app_module_id],
      ).first
    else
      @indicator = Indicator.new
      @indicator.indicator_type_id = params[:indicator_type_id]
      @indicator.indicator_level_id = params[:indicator_level_id]
      @indicator.year_id = params[:year_id]
      @indicator.month_id = params[:month_id]
      @indicator.week_id = params[:week_id]
      @indicator.service_id = params[:service_id]
      @indicator.subservice_id = params[:subservice_id]
      @indicator.application_id = params[:application_id]
      @indicator.app_module_id = params[:app_module_id]
    end
    respond_to do |format|
      format.js { render 'form', layout: false }
    end
  end

  private

  def indicator_params
    # params.require(:custom_field_enumerations).permit(:name, :active, :position) does not work here with param like this:
    # "custom_field_enumerations":{"0":{"name": ...}, "1":{"name...}}
    params.require(:indicator).permit(:indicator_level_id, :indicator_type_id, :service_id, :subservice_id, :analysis_a,
                                 :date, :year_id, :month_id, :week_id, :indicator_service, :application_id, :app_module_id,
                                 :responsible_id, :analysis_b, :analysis_c, :goal, :service_weight, :subservice_weight,
                                 :application_weight, :module_weight, :external_indicator_service, :external_indicator_subservice,
                                 :external_indicator_application, :external_indicator_module, :indicator_subservice, :indicator_application,
                                 :indicator_module, :value_service_a, :value_subservice_a, :value_application_a, :value_module_a,
                                 :value_service_b, :value_subservice_b, :value_application_b, :value_module_b)

  end
end
