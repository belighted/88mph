class ProjectsController < ApplicationController

  before_filter :require_user

  def index
    @project = current_company.projects.find(:all)
  end

  def new
    @project = current_company.projects.build
  end

  def create
     @project = current_company.projects.build(params[:project])
      if @project.save
        flash[:notice] = "Project created!"
        redirect_back_or_default project_url(@project)
      else
        flash[:notice] = "Oops, there is a problem"
        render :action => :new
      end
  end

  def show
    @project = current_company.projects.find(params[:id])
    @period_start = Time.parse(params[:period_start]) rescue Date.parse("1900-01-01")
    @period_end = Time.parse(params[:period_end]) rescue Date.parse("2100-01-01")
    @participation_times = @project.participations.map do |p|
      { :user => p.user,
        :total_time => p.total_time,
        :total_time_this_month => p.total_time_this_month,
        :total_time_this_week => p.total_time_this_week,
        :total_time_this_period => p.total_time_for_period(@period_start,@period_end) }
    end
    @max_time = @participation_times.max_by{|p| p[:total_time_this_period]}[:total_time_this_period]
  end

  def edit
    @project = current_company.projects.find(params[:id])
  end

  def update
    @project = current_company.projects.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project updated!"
      redirect_to project_url
    else
      render :action => :edit
    end
  end

  def destroy
    @project = current_company.projects.find(params[:id])
    if @project.destroy
      flash[:notice] = "Project has been deleted"
      redirect_to projects_path
    else
      flash[:error] = "Couldn't delete this project"
      redirect_to projects_path
    end
  end

end