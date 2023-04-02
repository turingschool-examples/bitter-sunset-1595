require 'rails_helper'

RSpec.describe '/projects/:id, Project Show Page' do
  Project.delete_all
  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }
  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch") }
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp") }
  let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:kentaro) { Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }
  let!(:jay_project_1) { ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:jay_project_2) { ContestantProject.create!(contestant_id: jay.id, project_id: boardfit.id) }
  let!(:gretchen_project_1) { ContestantProject.create!(contestant_id: gretchen.id, project_id: boardfit.id) }
  let!(:kentaro_project_1) { ContestantProject.create!(contestant_id: kentaro.id, project_id: lit_fit.id) }
  let!(:erin_project_1) { ContestantProject.create!(contestant_id: erin.id, project_id: lit_fit.id) }
  
  describe 'User Story 1' do
    it 'when I visit a project show page, I see that projects name, material, and challenge theme' do
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(news_chic.name)
      expect(page).to have_content("Material: #{news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{news_chic.challenge.theme}")
    end
  end

  describe 'User Story 3' do
    it 'will show a count of the number of contestants on this project' do
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Number of Contestants: 1")
    end
  end

  describe 'User Story Extension 1' do
    it 'will show the average years of experience for the contestants that worked on that project' do
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Average Contestant Experience: 13.0 years")
    end
  end

  describe 'User Story Extension 2' do
    it 'will show a form to add a contestant to this project' do
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Add a Contestant to this Project:")
      expect(page).to have_field(:contestant_id)
      expect(page).to have_button("Add Contestant To Project")
    end
  end

# As a visitor,
# When I visit a project's show page
# I see a form to add a contestant to this project
# When I fill out a field with an existing contestants id
# And hit "Add Contestant To Project"
# I'm taken back to the project's show page
# And I see that the number of contestants has increased by 1
# And when I visit the contestants index page
# I see that project listed under that contestant's name
end