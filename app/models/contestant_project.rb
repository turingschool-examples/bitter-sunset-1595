class ContestantProject < ApplicationRecord
  validates_presence_of :contestant_id, :project_id
  belongs_to :contestant
  belongs_to :project
end
