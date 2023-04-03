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

  describe 'instance methods' do
    let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }

    let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }

    let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
    let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  
    let!(:con_proj_1) { ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id) }
    let!(:con_proj_2) { ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id) }

    it '#num_of_contestants' do
      expect(news_chic.num_of_contestants).to eq(2)
    end

    it '#avg_experience' do
      expect(news_chic.avg_experience).to eq(12.5)
    end
  end
end
