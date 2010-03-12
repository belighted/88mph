class TimelinesController < ApplicationController

  before_filter :require_user

  def edit
    @projects = current_company.projects.all # TODO later, scope to the projects the user is *interested* in
    @time_slot = current_user.current_time_slot
  end

  def update
    @project = current_company.projects.find(params[:time_slot][:project_id])
    current_user.timeline.current_project = @project
    redirect_to edit_timeline_url # victory!
  end

end