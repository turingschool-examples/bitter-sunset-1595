require 'rails_helper'

RSpec.describe 'Contestant index page', type: :feature do

  let!(:recycled_material_challenge) { Challenge.create!(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000) }

  let!(:boardfit) { recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:news_chic) { recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper") }
  let!(:lit_fit) { furniture_challenge.projects.create!(name: "Litfit", material: "Lamp") }
  let!(:upholstery_tux) { furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch") }

  let!(:jay) { Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:kentaro) { Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }

  let!(:contestant_project_1) { ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:contestant_project_2) { ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id) }
  let!(:contestant_project_3) { ContestantProject.create!(contestant_id: gretchen.id, project_id: upholstery_tux.id) }
  let!(:contestant_project_4) { ContestantProject.create!(contestant_id: kentaro.id, project_id: upholstery_tux.id) }
  let!(:contestant_project_5) { ContestantProject.create!(contestant_id: kentaro.id, project_id: boardfit.id) }
  let!(:contestant_project_6) { ContestantProject.create!(contestant_id: erin.id, project_id: boardfit.id) }

  describe '/contestants' do
    it 'I see a list of names of all the contestants and a list of the projects they have been in' do
      visit '/contestants'
save_and_open_page
      Contestant.all.each do |contestant|
        expect(page).to have_content(contestant.name)
  
        contestant.projects.each do |project|
          expect(page).to have_content(project.name)
        end
      end
    end
  end
end