class User < ActiveRecord::Base

  acts_as_authentic
  belongs_to :company
  has_many :time_slots

  before_create :find_or_create_company_from_email_domain

  def current_time_slot
    self.time_slots.find(:first, :conditions => { :end => nil }) rescue nil
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def to_s
    full_name.present? ? full_name : email
  end

  def timeline
    @timeline ||= Timeline.new(:user =>self)
  end

  protected

  def find_or_create_company_from_email_domain
    self.company = Company.find_or_create_by_domain(Mail::Address.new(self.email).domain)
  end

end