require 'rails_helper'

RSpec.describe 'Project Show', type: :feature do
  recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
  news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
  boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

  
  describe 'User Story 1: As a visitor, when I visit ("/projects/:id")' do
    it "I see I see the project's name and material and theme of the challenge that this project belongs to." do
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("News Chic")
      expect(page).to have_content("Newspaper")
      expect(page).to have_content("Recycled Material")
      expect(page).to_not have_content("Boardfit")

    end
  end

end