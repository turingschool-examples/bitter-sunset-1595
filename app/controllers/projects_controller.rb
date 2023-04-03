class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    @contestant_count = @project.count_contestants
    @average_experience = @project.average_contestant_experience
  end
end
