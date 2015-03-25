class KlassResultSet < ActiveRecord::Base

  belongs_to :klass
  has_one :result_set_group, :as => :result_set 

  validates_presence_of :klass

end
