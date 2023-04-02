require 'rails_helper'


RSpec.describe Project, type: :model do
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }
  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch") }
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp") }
  let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:kentaro) { Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }
  let!(:jay_project_1) { ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:jay_project_2) { ContestantProject.create!(contestant_id: jay.id, project_id: boardfit.id) }
  let!(:gretchen_project_1) { ContestantProject.create!(contestant_id: gretchen.id, project_id: boardfit.id) }
  let!(:kentaro_project_1) { ContestantProject.create!(contestant_id: kentaro.id, project_id: lit_fit.id) }
  let!(:erin_project_1) { ContestantProject.create!(contestant_id: erin.id, project_id: lit_fit.id) }
  
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "class methods" do
    it "contestant_count" do
      expect(news_chic.contestant_count).to eq(1)
      expect(boardfit.contestant_count).to eq(2)
      expect(lit_fit.contestant_count).to eq(2)
    end

    it 'average_contestant_experience' do
      expect(news_chic.average_contestant_experience).to eq(13)
      expect(boardfit.average_contestant_experience).to eq(12.5)
      expect(lit_fit.average_contestant_experience.round).to eq(12)
    end
  end
end
