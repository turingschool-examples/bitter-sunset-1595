require 'rails_helper'


RSpec.describe ContestantProject, type: :model do
  describe 'validations' do
    it {should validate_presence_of :project_id}
    it {should validate_presence_of :contestant_id}
  end
  describe "relationships" do
    it {should belong_to :contestant}
    it {should belong_to :project}
  end
end
