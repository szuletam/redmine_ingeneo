class Responsible < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :first_name, :last_name, :user
  validates_presence_of :first_name, :last_name, :user
  validates_uniqueness_of :user

  has_many :responsible_indicators
  has_many :indicators
end
