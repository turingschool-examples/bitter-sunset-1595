require 'rails_helper'

RSpec.describe 'Contestants index page', type: :feature do
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000) }

  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
  let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch") }
  let!(:boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") }

  let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:kentaro) { Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }

  let!(:con_proj_1) { ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:con_proj_2) { ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id) }
  let!(:con_proj_3) { ContestantProject.create!(contestant_id: gretchen.id, project_id: upholstery_tux.id) }
  let!(:con_proj_4) { ContestantProject.create!(contestant_id: kentaro.id, project_id: upholstery_tux.id) }
  let!(:con_proj_5) { ContestantProject.create!(contestant_id: kentaro.id, project_id: boardfit.id) }

  describe 'As a visitor, when I visit the contestants index page' do
    it 'I see a list of names of all the contestants and their projects' do
      visit "/contestants/index"
      
      expect(page).to have_content('Contestants')
      expect(page).to have_content('Jay McCarroll')
      expect(page).to have_content('Projects: News Chic')
      expect(page).to have_content('Gretchen Jones')
      expect(page).to have_content('Projects: News Chic, Upholstery Tuxedo')
      expect(page).to have_content('Kentaro Kameyama')
      expect(page).to have_content('Projects: Upholstery Tuxedo, Boardfit')
      expect(page).to have_content('Erin Robertson')
      expect(page).to have_content('Projects:')
    end
  end
end