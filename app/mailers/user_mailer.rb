class UserMailer < ActionMailer::Base

  def invite(invitation)
    recipients invitation.invited_email
    from invitation.invitor.email
    subject "Join my awesome team on 88mph"
    body :url => new_user_url
  end

end