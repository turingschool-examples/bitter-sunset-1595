class ContestantsController <ApplicationController
  def index
    contestants = Contestant.all
    require 'pry'; bindqing.pry
  end
end