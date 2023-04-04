class ProjectsController < ApplicationController

  def show
    @project = Project.includes(:challenge).find(params[:id])
  end

end