class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    @projects = ContestantProject.all
  end
end