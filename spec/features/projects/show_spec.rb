require 'rails_helper'

RSpec.describe '/projects/:id', type: :feature do
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  
  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }

  let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }

  let!(:con_proj_1) { ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:con_proj_2) { ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id) }

  describe 'As a visitor, when I visit a pojects show page' do
    it 'I see that projects, material and the challenge that it belongs to' do
      visit "/projects/#{news_chic.id}"
      
      expect(page).to have_content('News Chic')
      expect(page).to have_content('Material: Newspaper')
      expect(page).to have_content('Challenge Theme: Recycled Material')
    end

    it 'I see a count of the number of contestants on this project' do
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content('Number of Contestants: 2')

    end
  end
end
