class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def add_contestant
    @project = Project.find(params[:id])
    begin
      @contestant = Contestant.find(params[:contestant_id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Contestant does not exist"
      redirect_to project_path(@project) and return
    end
    
    if @project.contestants.include?(@contestant)
      flash[:error] = "Contestant is already on this project"
    else
      @project.contestants << @contestant
      flash[:success] = "Contestant added to project"
    end

    redirect_to project_path(@project)
  end
end