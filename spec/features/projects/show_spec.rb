require 'rails_helper'

require 'rails_helper'

RSpec.describe 'Project show page', type: :feature do
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }

  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }

  describe 'As a visitor, when I visit a pojects show page' do
    it 'I see that projects name and material and the theme of the challenge that this project belongs to' do
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content('News Chic')
      expect(page).to have_content('Material: Newspaper')
      expect(page).to have_content('Challenge Theme: Recycled Material')
    end
  end
end