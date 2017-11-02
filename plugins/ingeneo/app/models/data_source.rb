class DataSource < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :name, :description
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :indicator_types
end
