class ProjectsController < ApplicationController
  def show
    @project = Project.find(:)
  end

private
  def project_params
    params.permit()
  end
end