class Timeline

  attr_reader :user

  def initialize(options={})
    @user = options[:user]
    super()
  end

  def current_project=(_project)
    # TODO refactor all this crap and move it to some sort of model
    current_time = Time.now
    new_project = _project
    current_time_slot = user.current_time_slot
    if current_time_slot
      if current_time_slot.project != new_project
        # we are switching to a new project
        current_time_slot.stop!
        new_time_slot = user.time_slots.create(:project => new_project)
      else
        # we are already working on that project so do nothing
      end
    else
      # We are working on nothing yet
      new_time_slot = user.time_slots.create(:project => new_project)
    end
  end

  def self.get_period(type, time)
    case type
    when "thisweek"
      start = time.round_to_day - time.wday
      [start , start + 7.days]
    when "thismonth"
      start = time - time.mday.days
      [start , start + time.days_in_month.days]
    when "lastweek"
      start = time.round_to_day - time.wday - 7.days
      [start , start + 7.days]
    when "lastmonth"
      end_of_month = time - time.mday.days
      start = end_of_month - (end_of_month-1.day).days_in_month.days
      [start, end_of_month]
    when "thisyear"
      start = Time.local(time.year)
      [start, start+1.year]
    when "lastyear"
      end_of_year = Time.local(time.year)
      [end_of_year-1.year, end_of_year]
    else
      [Date.parse("1900-01-01"),Date.parse("2100-01-01")]
    end
  end
end