module ApplicationHelper
  def relevant_time(time)
    time.today? ? "at #{l(time,:format=>:only_time)}" : "on #{l(time,:format=>:only_date)} at #{l(time,:format=>:only_time)}"
  end
end