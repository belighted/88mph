class User < ActiveRecord::Base

  acts_as_authentic
  belongs_to :company

  before_create :find_or_create_company_from_email_domain

  protected

  def find_or_create_company_from_email_domain
    self.company = Company.find_or_create_by_domain(Mail::Address.new(self.email).domain)
  end

end