require 'pp'

class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  def total_time
    TimeSlot.total_time(["user_id = ? and project_id = ?",user.id, project.id])
  end

  def total_time_this_week
    TimeSlot.total_time_this_week(["user_id = ? and project_id = ?",user.id, project.id])
  end

  def total_time_this_month
    TimeSlot.total_time_this_month(["user_id = ? and project_id = ?",user.id, project.id])
  end

end