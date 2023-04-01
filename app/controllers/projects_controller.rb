class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])

    if params[:contestant_id].present?
      @project.create_contestant_project(params[:contestant_id])
    end
    
    @challenge = @project.challenge
    @count = @project.count_contestants
    @ace = @project.average_contestant_experience

  end
end