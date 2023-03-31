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

  before :each do
    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
  end

  describe 'instance methods' do
    describe '.challenge_theme' do
      it 'returns the shelter name for the given pet' do
        expect(@news_chic.challenge_theme).to eq(@recycled_material_challenge.theme)
        expect(@boardfit.challenge_theme).to eq(@recycled_material_challenge.theme)
      end
    end
  end
end
