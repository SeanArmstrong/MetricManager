class Methood < ActiveRecord::Base
  
  belongs_to :klass
  has_many :method_result_sets

  validates_presence_of :klass

  def set_tasks_to_hidden
    self.display_tasks = false
    self.save!
  end

  def set_tasks_to_visible
    self.display_tasks = true 
    self.save!
  end
end
