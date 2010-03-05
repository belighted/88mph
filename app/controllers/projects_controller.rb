class ProjectsController < ApplicationController

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
        redirect_back_or_default company_projects_url(@project)
      else
        render :action => :new
      end
  end

  def show
    @project = current_company.projects.find(params[:id])
  end

  def edit
  end

  def update
  end

end