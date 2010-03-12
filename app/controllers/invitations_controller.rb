class InvitationsController < ApplicationController

  def create
    @inviation = Invitation.new(params[:inviation])
    @inviation.user = current_user
    if @inviation.save
      flash[:notice] = "Invitation sent!"
    else
      flash[:error] = "Invitation not sent!"
    end
    redirect_to users_url
  end

end