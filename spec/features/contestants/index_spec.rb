require 'rails_helper'

RSpec.describe '/projects/:id, Project Show Page' do
  Contestant.delete_all
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }
  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch") }
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp", ) }
  let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:kentaro) { Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }
  let!(:jay_project_1) { ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:jay_project_2) { ContestantProject.create!(contestant_id: jay.id, project_id: boardfit.id) }
  let!(:gretchen_project_1) { ContestantProject.create!(contestant_id: gretchen.id, project_id: boardfit.id) }
  let!(:kentaro_project_1) { ContestantProject.create!(contestant_id: kentaro.id, project_id: lit_fit.id) }
  let!(:erin_project_1) { ContestantProject.create!(contestant_id: erin.id, project_id: lit_fit.id) }
  

  describe 'User Story 2' do
    it 'when I visit the contestants index page, I see a list of names of all the contestants and a list of projects ' do
      visit "/contestants"

      expect(page).to have_content("Jay McCarroll Projects: News Chic Boardfit")
      expect(page).to have_content("Gretchen Jones")
      expect(page).to have_content("Projects: Boardfit")
      expect(page).to have_content("Kentaro Kameyama")
      expect(page).to have_content("Projects: Litfit")
      expect(page).to have_content("Erin Robertson")
      expect(page).to have_content("Projects: Litfit")
    end
  end
end