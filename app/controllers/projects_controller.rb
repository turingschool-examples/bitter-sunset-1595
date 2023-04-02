class ProjectsController < ApplicationController
  def show
    @projects = Project.all
    require 'pry'; binding.pry
  end
end