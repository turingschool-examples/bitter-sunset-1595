class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @contestant = Contestant.find(params[:contestant_id])
    @contestant_project = ContestantProject.new(contestant_id: @contestant.id, project_id: @project.id)
    
    if @contestant_project.save
      redirect_to "/projects/#{params[:id]}"
    else
      render :new
    end
  end
end