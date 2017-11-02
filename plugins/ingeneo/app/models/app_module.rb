class AppModule < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :name, :internal_code, :application_id
  validates_presence_of :name, :internal_code, :application_id
  validates_uniqueness_of :name

  belongs_to :application
  has_many :indicator_levels
  has_many :indicators
end
