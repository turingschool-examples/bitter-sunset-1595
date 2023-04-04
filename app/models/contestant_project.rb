class ContestantProject < ApplicationRecord
  validates_presence_of :project_id, :contestant_id
  belongs_to :contestant
  belongs_to :project
end
