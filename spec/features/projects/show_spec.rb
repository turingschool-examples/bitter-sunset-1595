require 'rails_helper'

RSpec.describe '/projects/:id', type: :feature do
  describe 'As a visitory when I visit a projects show page' do
    before(:each) do
      @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")
    end

    it 'I can see that projects name, material and the challenge theme' do
      visit "/projects/#{upholstery_tux.id}"

      expect(page).to have_content("Project Upholstery Tuxedo")
      expect(page).to have_content("Material: Couch")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end
  end
end