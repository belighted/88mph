class Project < ActiveRecord::Base

  belongs_to :company
  has_many :participations
  has_many :users, :through => :participations

  validates :name, :presence => true
  validates :description, :presence => true, :length => {:maximum => 200}

  def to_s
    name
  end

  def total_time
    TimeSlot.total_time(["project_id = ?", id])
  end

  def total_time_this_week
    TimeSlot.total_time_this_week(["project_id = ?", id])
  end

  def total_time_this_month
    TimeSlot.total_time_this_month(["project_id = ?", id])
  end

  def self.projects_total_time
    Project.all.inject{|project1, project2| project1.total_time + project2.total_time}
  end

end