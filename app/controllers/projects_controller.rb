class ProjectsController < ApplicationController
  def show
    @projects = Project.all
    @challenges = Challenge.all
  end
end