class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = Challenge.find(@project.challenge_id)
    @contestant_projects = ContestantProject.where(project_id: @project.id)
  end

  def create
    @project = Project.find(params[:id])
    ContestantProject.create!(project_id: @project.id, contestant_id: params[:contestant_id])
    redirect_to "/projects/#{@project.id}"
  end
end