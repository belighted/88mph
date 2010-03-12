class Invitation < ActiveRecord::Base

  belongs_to :user

  attr_accessible :email

  after_create :send_invitation

  validates :email, :presence => true, :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :length => { :maximum => 200 }

  def send_invitation
    Mailer.invite(self.user, self.email).deliver
  end

end