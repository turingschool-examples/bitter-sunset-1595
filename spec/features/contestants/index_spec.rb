require 'rails_helper'

RSpec.describe 'contestants index page' do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch") 
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @jay.id, project_id: @boardfit.id)

    visit '/contestants'
  end
  
  describe 'When I visit the contestants index page' do
    it 'I see a list of names of all the contestants 
      and under each contestants name I see a list of the projects' do
     save_and_open_page
      expect(page).to have_content("Name: #{@jay.name}")
      expect(page).to have_content("#{@news_chic.name}")
      expect(page).to have_content("#{@boardfit.name}")
      expect(page).to have_content("Name: #{@gretchen.name}")
      expect(page).to have_content("#{@upholstery_tux.name}")
    end
  end
end
