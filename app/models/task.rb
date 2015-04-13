class Task < ActiveRecord::Base
  belongs_to :project

  validates :name, length: { minimum: 3, maximum: 20 }, presence: true
  validates :project, presence: true
  validates :description, length: { maximum: 100 }
  validates :due_date, presence: true
  validates :start_date, presence: true
  validates :completed_at, presence: { message: "Must be present if the task is complete" } , :if => :is_complete?

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

  def set_to_hidden
    self.visible_on_graphs = false 
    self.save!
  end

  def set_to_display
    self.visible_on_graphs = true
    self.save!
  end

  private

  def is_complete?
    self.complete
  end
end
