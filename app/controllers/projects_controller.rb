class ProjectsController < ApplicationController
  def show
    # require 'pry'; binding.pry
    @project = Project.find(params[:id])
  end
end