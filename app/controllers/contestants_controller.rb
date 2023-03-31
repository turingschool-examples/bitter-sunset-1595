class ContestantsController < ApplicationController

  def index
    @contestants = Contestant.all
    # @projects = Project.all
    # require 'pry'; binding.pry
  end

end