require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "class methods" do
    it "::avg_experience" do
    @challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @project = @challenge.projects.create!(name: "News Chic", material: "Newspaper")
    
    @contestant_1 = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @contestant_2 = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @contestant_3 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @contestant_4 = Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    @contestant_1.projects << @project
    @contestant_2.projects << @project
    @contestant_3.projects << @project
    @contestant_4.projects << @project

      expect(Contestant.avg_experience.round(2)).to eq(12)
    end
  end
end
