class Methood < ActiveRecord::Base
  
  belongs_to :klass

  validates_presence_of :klass
end
