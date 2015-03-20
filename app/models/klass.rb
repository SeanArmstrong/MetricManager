class Klass < ActiveRecord::Base

  belongs_to :project
  has_many :methoods
  has_many :klass_result_sets

  validates_presence_of :project
  validates_presence_of :name
end
