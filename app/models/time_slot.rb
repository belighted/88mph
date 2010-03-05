class TimeSlot < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  before_validation :set_start_time, :on => :create

  def stop!
    self.end = Time.now
    save
  end

  protected

  def set_start_time
    self.start = Time.now
  end

end