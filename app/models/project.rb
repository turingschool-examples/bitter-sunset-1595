class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    challenge.theme
  end

  def number_of_contestants
    ContestantProject.where(project_id: id).count
  end

  def average_years_experience
    contestants = ContestantProject.select(:contestant_id).where(project_id: id)
    Contestant.where(id: contestants).average(:years_of_experience)
  end
end
