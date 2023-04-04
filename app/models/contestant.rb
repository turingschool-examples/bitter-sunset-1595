class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def project_names
    projects = ContestantProject.select(:project_id).where(contestant_id: id)
    Project.where(id: projects).pluck(:name)
  end
end
