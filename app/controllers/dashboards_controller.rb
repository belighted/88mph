class DashboardsController < ApplicationController

  before_filter :require_user

  def show
    @user = current_user
    render :template => 'users/show'
  end

end