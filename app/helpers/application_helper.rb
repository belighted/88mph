module ApplicationHelper

  def relevant_time(time)
    time.today? ? "at #{l(time,:format=>:only_time)}" : "on #{l(time,:format=>:only_date)} at #{l(time,:format=>:only_time)}"
  end

  def formatted_duration(seconds)
    minutes = (seconds / 60.0).round
    elapsed_time = Time.now.at_beginning_of_year.advance(:minutes => minutes)
    if minutes > 1
      [[:days, elapsed_time.yday-1], [:hours, elapsed_time.hour], [:minutes, elapsed_time.min]].map do |elem|
        elem.last.zero? ? "" : "#{elem.last} #{elem.first.to_s}"
      end.join(" ")
    else
      "Less than one minute"
    end
  end

  def hours_from_seconds(seconds)
    ((seconds / 36.0).round)/100.0
  end

end