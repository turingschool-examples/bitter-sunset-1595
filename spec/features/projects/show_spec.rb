require 'rails_helper'

RSpec.describe 'project show page' do
  before(:each) do
    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
  end

  #User Story 1
  describe "When i visit /projects/:id" do
    it "displays the projects name and material and theme of challenge" do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content(" News Chic")
      expect(page).to have_content("Material: Newspaper")
      expect(page).to have_content("Challenge Theme: Recycled Material")

      expect(page).to_not have_content("Boardfit")
      expect(page).to_not have_content("Apartment Furnishings")
    end
  end

  #User Story 3
  describe "When i visit /projects/:id" do
    it "displays a count of contestants on this project" do
      
      
    end
  end
end