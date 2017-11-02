class IndicatorLevel < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :indicator_type_id, :service_id, :subservice_id, :application_id, :app_module_id
  validates_presence_of :indicator_type_id, :service_id, :subservice_id

  belongs_to :indicator_type
  belongs_to :service
  belongs_to :subservice
  belongs_to :application
  belongs_to :app_module

  has_many :indicators

end
