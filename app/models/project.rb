class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def count_contestants
    contestants.count
  end

  def average_contestant_experience
    contestants.average(:years_of_experience)
  end

  def create_contestant_project(c_input_id)
    ContestantProject.create(contestant_id: c_input_id, project_id: id)
  end
end
