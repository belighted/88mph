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

  def total_time_for_period(period_start=Time.parse("1900-01-01"), period_end=Time.parse("2100-01-01"))
    TimeSlot.total_time_for_period(["user_id = ? and project_id = ?",user.id, project.id],period_start,period_end)
  end

end