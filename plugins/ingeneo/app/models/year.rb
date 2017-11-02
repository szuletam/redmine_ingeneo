class Year < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :name
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :indicators
end
