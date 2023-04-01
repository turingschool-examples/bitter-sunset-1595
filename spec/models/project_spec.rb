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

  describe "instance methods" do
    before(:each) do
      @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")

      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
      ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    end

    it 'can count contestants per project' do
      expect(@upholstery_tux.count_contestants).to eq(2)
    end

    it 'can calculate average years of experience of contestants' do
      expect(@upholstery_tux.average_contestant_experience).to eq(10.0)
    end
  end
end
