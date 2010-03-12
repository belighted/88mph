class Mailer < ActionMailer::Base

  def invite(sender, receiver_email)
    recipients receiver_email
    from sender.email
    subject "Invite for 88mph"
    body "You are invited!" # TODO add accept link
  end

end