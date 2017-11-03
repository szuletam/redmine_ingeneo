class Macroprocess < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :name
  validates_presence_of :name
  has_many :subprocesses
end
