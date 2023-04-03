class ContestantProject < ApplicationRecord
  belongs_to :contestant
  belongs_to :project

  def self.all_contestants(project_id)
    where("project_id = #{project_id}")
  end

end
