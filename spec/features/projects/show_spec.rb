require 'rails_helper'

RSpec.describe '/projects/:id', type: :feature do
  describe 'As a visitory when I visit a projects show page' do
    before(:each) do
      @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")

      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
      ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    end

    it 'I can see that projects name, material and the challenge theme' do
      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content("Project Upholstery Tuxedo")
      expect(page).to have_content("Material: Couch")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end

    it 'I see a count of the number of contestants on this project' do
      visit "projects/#{@upholstery_tux.id}"

      expect(page).to have_content("Number of Contestants: 2")
    end
  end
end