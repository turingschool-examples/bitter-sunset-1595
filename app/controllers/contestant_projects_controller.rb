class ContestantProjectsController < ApplicationController
  def create
   ContestantProject.create(contestant_id: params[:contestant_id], project_id: params[:project])
   redirect_to "/projects/#{params[:project]}"
  end
end