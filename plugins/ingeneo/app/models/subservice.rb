class Subservice < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :name, :internal_code, :service_id
  validates_presence_of :name, :internal_code, :service_id

  belongs_to :service
  has_many :indicator_levels
  has_many :indicators
end
