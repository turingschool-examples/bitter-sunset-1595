class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    @count_of_contestants = @project.count_of_contestants
  end
end