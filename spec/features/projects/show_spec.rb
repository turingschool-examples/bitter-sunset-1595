require 'rails_helper'

RSpec.describe 'Project show page', type: :feature do

  let!(:furniture_challenge) { Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000) }
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp Shade") }

  describe '/projects/:id' do
    it "when I visit the project's show page I see that project's name and material and the challenge this project belongs to" do
      visit "/projects/#{lit_fit.id}"
save_and_open_page
      expect(page).to have_content("Litfit")
      expect(page).to have_content("Material: Lamp Shade")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
      expect(page).to have_content("Number of Contestants: 0")
    end
  end
end