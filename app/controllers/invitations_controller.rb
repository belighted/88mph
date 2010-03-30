class InvitationsController < ApplicationController

  def create
    @invitation = Invitation.new(current_user, params[:invitation][:invited_email_local]+"@"+Mail::Address.new(current_user.email).domain)

    if @invitation.save
      flash[:notice] = "Invitation sent!"
    else
      flash[:error] = "Invitation not sent!"
    end
    redirect_to users_url
  end

end