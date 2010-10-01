class UserMailer < ActionMailer::Base

  def invite(invitation)
    @url = new_user_url
    mail(:to => invitation.invited_email, :from => invitation.invitor.email, :subject => "Join my awesome team on 88mph")
  end

end
