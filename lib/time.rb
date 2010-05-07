class Time
  def round_to_day
    Time.local(year, month, day)
  end

  def days_in_month
    new_year = year
    new_month = month+1
    if new_month > 12
      new_month -= 12
      new_year += 1
    end
    (Time.local(new_year,new_month,1)-1.day).day
  end
end
