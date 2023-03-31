require 'rails_helper'

RSpec.describe "Project Show page" do

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  describe "diplays attributes and challenge theme" do
    it "displays projects name and material" do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content("Boardfit")
      expect(page).to have_content("Cardboard Boxes")
      expect(page).to_not have_content(@news_chic.name)
    end

    it "displays theme of challenge it belongs to" do
      visit "/projects/#{@boardfit.id}"
      
      expect(page).to have_content(@recycled_material_challenge.theme)
    end
  end

  describe "count of projects" do
    it "Displays number of contestants on this project" do
      visit "/projects/#{@boardfit.id}"
      
      expect(page).to have_content("Number of contestants: 2")
    end
  end
  describe "average contestant experience" do
    it 'Displays the average years of experience between the contestants on this project' do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content("Average Contestant Experience: 11.5 years")
    end
  end
end