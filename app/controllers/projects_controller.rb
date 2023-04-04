class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @challenge = Challenge.find(@project.challenge_id)
  end

  def create
    project = Project.new(project_params)
  end

  def project_params
    params.permit(:name, :material)
  end
end