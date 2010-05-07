class TimelinesController < ApplicationController

  def verify_authenticity_token
    auth = Rack::Auth::Basic::Request.new(request.env)
    if auth.provided? and auth.basic?
      true
    else
      super
    end
  end

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
    respond_to do |format|
      format.html do
        if params[:time_slot] && params[:time_slot][:project_id]
          @project = current_company.projects.find(params[:time_slot][:project_id])
          current_user.timeline.current_project = @project
          flash[:notice] = "Timeline updated!"
          redirect_to edit_timeline_url # victory!
        else
          flash[:notice] = "Please select a project to track!"
          redirect_to edit_timeline_url # fail!
        end
      end

      # Client Request
      format.json do
        if params[:time_slot][:project_name]
          @project = current_company.projects.find_by_name(params[:time_slot][:project_name])
          current_user.timeline.current_project = @project
        end

        render :json => @project.id
      end
    end
  end
end