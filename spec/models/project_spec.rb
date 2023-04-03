require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  let!(:contestant_1) { Contestant.create!(name: "Kentaro Kameyama", age: 35, hometown: "Okinawa, Japan", years_of_experience: 25) }
  let!(:contestant_2) { Contestant.create!(name: "Jay McCarroll", age: 21, hometown: "Los Angeles, California", years_of_experience: 3) }

  let!(:challenge_1) { Challenge.create!(theme: "Apartment Furnishing", project_budget: 1000)}
  let!(:challenge_2) { Challenge.create!(theme: "Party Clothes", project_budget: 500)}
  
  let!(:project_1) { Project.create!(name: "Litfit", material: "Lamp Shade", challenge: challenge_1 ) }
  let!(:project_2) { Project.create!(name: "LeatherFeather", material: "Leather", challenge: challenge_2) }
  let!(:project_3) { Project.create!(name: "Rug Tuxedo", material: "Rug", challenge: challenge_1) }

  before do
    ContestantProject.create!(contestant: contestant_1, project: project_1)
    ContestantProject.create!(contestant: contestant_1, project: project_3)

    ContestantProject.create!(contestant: contestant_2, project: project_2)
    ContestantProject.create!(contestant: contestant_2, project: project_1)
  end

  describe "instance methods" do
    it "contestant_count" do
      expect(project_1.contestant_count).to eq(2)
      expect(project_2.contestant_count).to eq(1)
      expect(project_3.contestant_count).to eq(1)
    end
  end
end
