class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    # require 'pry'; binding.pry
    # @contestantproject = ContestantProject.find(params[:contestant_id])
  end
end