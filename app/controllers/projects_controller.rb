class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  private 
  def project_params
    params.permit(:name, :material)
  end
end