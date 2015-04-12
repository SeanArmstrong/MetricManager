class Project < ActiveRecord::Base

  belongs_to :user
  has_many :klasses
  has_many :tasks

  validates_presence_of :user_id
  validates_presence_of :name

  validates :name, length: { minimum: 3, maximum: 30 }
  
  before_create :add_guid

  def get_total_result_sets
    klass_id = self.klasses.where(is_total: true).ids
    KlassResultSet.where(is_total: true).where(klass_id: klass_id)
  end

  def set_tasks_to_hidden
    self.display_tasks = false
    self.save!
  end

  def set_tasks_to_visible
    self.display_tasks = true 
    self.save!
  end

  private
  
  def add_guid
    self.guid = SecureRandom.uuid
  end
end
