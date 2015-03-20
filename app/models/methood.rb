class Methood < ActiveRecord::Base
  
  belongs_to :klass
  has_many :method_result_sets

  validates_presence_of :klass
end
