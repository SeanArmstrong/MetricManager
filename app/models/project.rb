class Project < ActiveRecord::Base

  belongs_to :user
  has_many :klasses
  has_many :tasks

  validates_presence_of :user_id
  validates_presence_of :name
  
  before_create :add_guid

  private
  
  def add_guid
    self.guid = SecureRandom.uuid
  end
end
