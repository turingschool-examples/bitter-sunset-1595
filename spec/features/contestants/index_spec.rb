require 'rails_helper'

RSpec.describe '/contestants', type: :feature do
  describe 'As a visitor, when I visit the contestants index page' do
    before(:each) do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      @news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    end

    it 'I see a list of names of all the contestants and a list of the projects theyve been on' do
      visit '/contestants'

      expect(page).to have_content('Contestant Index Page')
      expect(page).to have_content('Jay McCarroll')
      expect(page).to have_content('Projects: News Chic')
    end
  end
end