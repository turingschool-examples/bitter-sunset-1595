class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @contestants = Project.joins(:contestant_projects).where("project_id = #{params[:id]}").select(:name)
  end
end