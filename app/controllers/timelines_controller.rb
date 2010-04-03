class TimelinesController < ApplicationController

  before_filter :require_user

  def edit
    @projects = current_user.projects
    @time_slot = current_user.current_time_slot
    respond_to do |format|
      format.html
      format.json {
        # return a Hash with project names as keys, and if it is the current project as value
        render :json => @projects.each_with_object({}) { |p,h| h[p.name] = (p.id == @time_slot.project_id) }
        #=> {"test":true,"project_b":false}
      }
    end
  end

  def update
    if params[:time_slot]
      if params[:time_slot][:project_name] # Cocoa Client Request # not working yet
        @project = current_company.projects.find_by_name(params[:time_slot][:project_name])
        p @project
      elsif params[:time_slot][:project_id]
        @project = current_company.projects.find(params[:time_slot][:project_id])
        if @project.save
          current_user.timeline.current_project = @project
          flash[:notice] = "Timeline updated!"
          redirect_to edit_timeline_url # victory!
        end
      else
        flash[:notice] = "Please select a project to track!"
        redirect_to edit_timeline_url
      end
    end
  end

end