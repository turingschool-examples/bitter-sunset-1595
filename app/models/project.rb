class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_number
    self.contestants.count
  end

  def average_contestant_experience
    contestant_experience_holder = []
    self.contestants.each do |contestant|
      contestant_experience_holder << contestant.years_of_experience
    end
    if contestant_experience_holder.empty? 
      return "No Registered Contestants"
    else
    contestant_experience_holder.sum / contestant_experience_holder.count
    end
  end
end
