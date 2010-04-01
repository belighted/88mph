require 'pp'

class TimeSlot < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  scope :wholly_included_in_period,       lambda { |_start,_end| { :conditions => ["start >= ? AND (\"end\" <= ? OR \"end\" IS NULL)", _start, _end] } }
  scope :overlapping_beginning_of_period, lambda { |_start,_end| { :conditions => ["start < ? AND (\"end\" > ? OR \"end\" IS NULL)", _start, _start] } }
  scope :overlapping_end_of_period,       lambda { |_start,_end| { :conditions => ["start >= ? AND start < ? AND (\"end\" > ? OR \"end\" IS NULL)", _start, _end, _end] } }

  before_validation :set_start_time, :on => :create

  def stop!
    self.end = Time.now
    save
  end

  def self.total_time_for_period(where="", period_start=Time.parse("1900-01-01"), period_end=Time.parse("2100-01-01"))
    timeslots = []
    pp where
    query = TimeSlot.where(where)
    timeslots << query.wholly_included_in_period(period_start, period_end).all
    timeslots << query.overlapping_beginning_of_period(period_start, period_end).all
    timeslots << query.overlapping_end_of_period(period_start, period_end).all
    timeslots = timeslots.flatten.uniq
    timeslots.each do |timeslot|
      timeslot.start = period_start if (timeslot.start < period_start)
      timeslot.end = [period_end,Time.now].min if (timeslot.end.nil? || (timeslot.end > period_end))
    end
    formatted_duration_from_timeslots(timeslots)
  end

  def self.total_time(where="")
    total_time_for_period(where)
  end

  def self.total_time_this_month(where="")
    total_time_for_period(where,Time.now.beginning_of_month,Time.now.end_of_month)
  end

  def self.total_time_this_week(where="")
    total_time_for_period(where,Time.now.beginning_of_week,Time.now.end_of_week)
  end

  protected

  def set_start_time
    self.start = Time.now
  end

  def self.formatted_duration_from_timeslots(timeslots)
    seconds = timeslots.inject(0) { |sum,timeslot| sum + (timeslot.end - timeslot.start) }.to_i
    minutes = (seconds / 60.0).round
    elapsed_time = Time.now.at_beginning_of_year.advance(:minutes => minutes)
    [[:days, elapsed_time.yday-1], [:hours, elapsed_time.hour], [:minutes, elapsed_time.min]].map do |elem|
      elem.last.zero? ? "" : "#{elem.last} #{elem.first.to_s}"
    end.join(" ")
  end

end