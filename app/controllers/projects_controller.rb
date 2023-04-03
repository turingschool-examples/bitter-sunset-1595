class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @contestants_count = @project.contestants.count
  end
end