class  ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = Challenge.find(@project.challenge_id)
    @contestant_projects = ContestantProject.all_contestants(@project.id)
    @average_experience = @project.contestants.average(:years_of_experience)
  end
end