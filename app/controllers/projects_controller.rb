class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    @count = @project.count_contestants
    @ace = @project.average_contestant_experience
  end
end