class IndicatorType < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :microprocess_id, :data_source_id, :name, :active, :label_a, :label_b, :goal
  validates_presence_of :microprocess_id, :data_source_id, :name, :active, :goal
  validates_uniqueness_of :name
  belongs_to :microprocess
  belongs_to :data_source
  has_many :responsible_indicators
  has_many :indicator_levels
  has_many :indicators
end
