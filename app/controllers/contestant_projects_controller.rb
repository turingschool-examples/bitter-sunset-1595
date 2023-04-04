class ContestantProjectsController < ApplicationController 
  def create
    contestant_project = ContestantProject.new(contestant_project_params)
    contestant_project.save
    redirect_to "/projects/#{params[:project_id]}"
  end

  private
  def contestant_project_params
    params.permit(:project_id, :contestant_id)
  end
end