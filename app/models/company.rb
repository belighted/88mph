class Company < ActiveRecord::Base

  has_many :users
  has_many :projects

  before_validation :set_name_from_domain_if_blank, :on => :create

  def to_s
    name
  end

  protected

  def set_name_from_domain_if_blank
    self.name = self.domain.split(".").first.capitalize if self.name.blank?
  end

end