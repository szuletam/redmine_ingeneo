class Service < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :name, :internal_code
  validates_presence_of :name, :internal_code
  validates_uniqueness_of :name

  has_many :subservices
  has_many :indicator_levels
  has_many :indicators
end
