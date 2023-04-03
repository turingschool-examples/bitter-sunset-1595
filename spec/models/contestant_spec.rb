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

  describe 'instance methods' do
    let!(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }
    let!(:news_chic) { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }
    let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
    it '#current_projects' do
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

    expect(jay.current_projects).to eq(["News Chic"])
    end
  end
end
