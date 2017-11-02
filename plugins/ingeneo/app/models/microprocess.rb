class Microprocess < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :macroprocess_id, :name, :internal_code
  validates_presence_of :macroprocess_id, :name, :internal_code
  validates_uniqueness_of :name
  has_many :indicator_types
  belongs_to :macroprocess
end
