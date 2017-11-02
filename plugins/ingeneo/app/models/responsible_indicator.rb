class ResponsibleIndicator < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes :indicator_type_id, :responsible_id, :active
  validates_presence_of :indicator_type_id, :responsible_id

  belongs_to :indicator_type
  belongs_to :responsible
end
