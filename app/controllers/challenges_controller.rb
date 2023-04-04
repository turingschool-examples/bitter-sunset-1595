class ChallengesController < ApplicationController
  def create
    challenge = Challenge.new(challenge_params)
  end

  def project_params
    params.permit(:theme, :project_budget)
  end
end