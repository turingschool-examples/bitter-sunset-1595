class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @challenge_theme = @project.challenge.theme
  end
end