class Invitation
  include ActiveModel::Validations

  attr_accessor :invitor, :invited_email

  validates :invited_email, :presence => true, :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :length => { :maximum => 200 }

  def initialize(invitor, invited_email)
    @invitor, @invited_email = invitor, invited_email
  end

  def save
    send_invitation if valid?
  end

  protected

  def send_invitation
    UserMailer.invite(self).deliver
  end
end