class Indicator < ActiveRecord::Base
  include Redmine::SafeAttributes

	safe_attributes :indicator_level_id, :indicator_type_id, :service_id, :subservice_id, :analysis_a,
									:date, :year_id, :month_id, :week_id, :indicator_service, :application_id, :app_module_id,
									:responsible_id, :analysis_b, :analysis_c, :goal, :service_weight, :subservice_weight,
									:application_weight, :module_weight, :external_indicator_service, :external_indicator_subservice,
									:external_indicator_application, :external_indicator_module, :indicator_subservice, :indicator_application,
									:indicator_module, :value_service_a, :value_subservice_a, :value_application_a, :value_module_a,
									:value_service_b, :value_subservice_b, :value_application_b, :value_module_b

	validates_presence_of :indicator_level_id, :indicator_type_id, :service_id, :subservice_id, :analysis_a,
												:date, :year_id, :month_id, :week_id, :indicator_service

	belongs_to :indicator_level
	belongs_to :indicator_type
	belongs_to :service
	belongs_to :subservice
	belongs_to :application
	belongs_to :app_module
	belongs_to :responsible
	belongs_to :year
	belongs_to :month
	belongs_to :week


	def safe_attributes=(attrs, user=User.current)
		return unless attrs.is_a?(Hash)
		super(attrs, user)
	end

end
