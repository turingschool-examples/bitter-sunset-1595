require 'rails_helper'

RSpec.describe 'Project Show', type: :feature do
  news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
  boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

  
  describe 'User Story 1: As a visitor, when I visit ("/projects/:id")' do
    it "I see I see the project's name and material" do
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      visit "/projects/#{news_chic.id}"

      
    end
  end

end