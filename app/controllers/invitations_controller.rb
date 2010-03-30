class InvitationsController < ApplicationController

  def create
    @inviation = Invitation.new(current_user, params[:invitation][:invited_email])

    if @inviation.save
      flash[:notice] = "Invitation sent!"
    else
      flash[:error] = "Invitation not sent!"
    end
    redirect_to users_url
  end

end