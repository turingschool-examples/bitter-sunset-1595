require 'rails_helper'

RSpec.describe 'Project Show Page' do
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }
  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch") }
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp") }
  
  describe 'User Story 1' do
    it 'when I visit a project show page, I see that projects name, material, and challenge theme' do
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(news_chic.name)
      expect(page).to have_content("Material: #{news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{news_chic.challenge.theme}")
    end
  end
end