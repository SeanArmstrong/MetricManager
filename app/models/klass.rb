class Klass < ActiveRecord::Base

  belongs_to :project
  has_many :methoods
  has_many :klass_result_sets

  validates_presence_of :project
  validates_presence_of :name


  def set_tasks_to_hidden
    self.display_tasks = false
    self.save!
  end

  def set_tasks_to_visible
    self.display_tasks = true 
    self.save!
  end
end
