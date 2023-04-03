class ContestantProjectsController < ApplicationController
  
  def create
    project = Project.find(params[:project_id])
    contestant = Contestant.find(params[:contestant_id])
    ContestantProject.create(contestant: contestant, project: project)
    redirect_to "/projects/#{project.id}"
  end
end