class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    self.challenge.theme
  end

  def contestant_count
    self.contestants.count
  end

  def average_contestant_experience
    self.contestants.average(:years_of_experience).to_f
  end
end
