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
    let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
    let!(:furniture_challenge) { Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000) }

    let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
    let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch") }

    let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }

    let!(:con_proj_2) { ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id) }
    let!(:con_proj_3) { ContestantProject.create!(contestant_id: gretchen.id, project_id: upholstery_tux.id) }
    
    it '#all_projects' do
      expect(gretchen.all_projects).to eq(['News Chic', 'Upholstery Tuxedo'])
    end
  end
end
