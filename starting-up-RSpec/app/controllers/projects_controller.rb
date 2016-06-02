class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to projects_path
    else
      flash[:alert] = "Project has not been created."
      render :new
    end

  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

end
