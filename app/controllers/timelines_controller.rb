class TimelinesController < ApplicationController

  before_filter :require_user

  def edit
    @projects = current_company.projects.all # TODO later, scope to the projects the user is *interested* in
  end

  def update
    # TODO refactor all this crap and move it to some sort of model
    current_time = Time.now
    new_project = current_company.projects.find(params[:time_slot][:project_id])
    current_time_slot = current_user.current_time_slot
    if current_time_slot
      if current_time_slot.project != new_project
        # we are switching to a new project
        current_time_slot.stop!
        new_time_slot = current_user.time_slots.create(:project => new_project)
      else
        # we are already working on that project so do nothing
      end
    else
      # We are working on nothing yet
      new_time_slot = current_user.time_slots.create(:project => new_project)
    end
    redirect_to edit_timeline_url # victory!
  end

end