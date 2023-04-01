class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    @count = @project.count_contestants
  end
end