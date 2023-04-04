class ContestantProjectsController < ApplicationController
  def create
    @contestant = Contestant.where("name = #{params[:name]}")
    @project = params[:project_id]
    require 'pry'; binding.pry
    ContestantProject.create!(contestant_id: @contestant.id, project_id: @project)
    redirect_to "/projects#{@project}"
  end
end