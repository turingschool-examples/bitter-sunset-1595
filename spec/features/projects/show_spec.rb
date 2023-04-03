require 'rails_helper'

RSpec.describe '/projects/:id', type: :feature do
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000) }
  
  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes") }
  
  let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")}
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp") }

  describe 'As a visitor, when I visit a pojects show page' do
    it 'I see that projects, material and the challenge that it belongs to' do
      visit "/projects/#{news_chic.id}"
      
      expect(page).to have_content('News Chic')
      expect(page).to have_content('Material: Newspaper')
      expect(page).to have_content('Challenge Theme: Recycled Material')
    end
  end
end
