class Task < ActiveRecord::Base
  belongs_to :project

  def set_to_completed
    self.complete = true
    self.completed_at = DateTime.now.to_date
    self.save!
  end
  
  def set_to_uncompleted
    self.complete = false
    self.completed_at = nil
    self.save!
  end
end
