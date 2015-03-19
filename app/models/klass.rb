class Klass < ActiveRecord::Base

  belongs_to :project
  has_many :methoods

  validates_presence_of :project
  validates_presence_of :name
end
