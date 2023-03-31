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

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
  end

  describe "can retrieve challenge theme" do
    it 'project is able to retrieve theme of challenge' do

    expect(@boardfit.challenge_theme).to eq("Recycled Material")
    end
  end

  describe "contestant_count" do
    it "can provide the number of contestant on the project" do

    expect(@boardfit.contestant_count).to eq(3)
    end
  end
end
