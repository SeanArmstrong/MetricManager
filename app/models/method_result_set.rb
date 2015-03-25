class MethodResultSet < ActiveRecord::Base

  belongs_to :methood
  has_one :result_set_group, :as => :result_set 

  validates_presence_of :methood_id
end
