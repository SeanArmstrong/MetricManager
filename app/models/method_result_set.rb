class MethodResultSet < ActiveRecord::Base

  belongs_to :methood
  validates_presence_of :method_id
end
