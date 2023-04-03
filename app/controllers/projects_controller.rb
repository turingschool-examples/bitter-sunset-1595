class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @challenge_theme = @project.challenge.theme
    @sum_contestants = @project.num_of_contestants
  end
end