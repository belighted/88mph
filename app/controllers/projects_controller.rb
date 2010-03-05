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
        render :action => :new
      end
  end

  def show
    @project = current_company.projects.find(params[:id])
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

end