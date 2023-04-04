require 'rails_helper'


RSpec.describe Project, type: :model do

  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000) }

  let!(:boardfit) { recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp") }

  let!(:kentaro) { Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }

  let!(:contestant_project_5) { ContestantProject.create!(contestant_id: kentaro.id, project_id: boardfit.id) }
  let!(:contestant_project_6) { ContestantProject.create!(contestant_id: erin.id, project_id: boardfit.id) }

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
    describe '#contestants_count' do
      it 'counts the number of contestants a project has' do
        expect(lit_fit.contestants_count).to eq(0)
        expect(boardfit.contestants_count).to eq(2)
      end
    end
  end
end
