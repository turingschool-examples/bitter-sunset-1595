class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    @average_experience = Contestant.avg_experience
  end
end