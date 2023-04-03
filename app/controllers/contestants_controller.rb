class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.includes(:projects)
  end
end