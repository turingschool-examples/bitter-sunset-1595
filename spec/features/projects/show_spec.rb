require 'rails_helper'

RSpec.describe 'projects/show page' do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    visit "/projects/#{@news_chic.id}"
  end

  describe 'When I visit a projects show page' do
    it 'I see that projects name and material' do
      save_and_open_page
      expect(page).to have_content("Project Name: #{@news_chic.name}")
      expect(page).to have_content("Material: #{@news_chic.material}")
      expect(page).to_not have_content("Name: #{@upholstery_tux.name}")
    end

    it 'I also see the theme of the challenge that this project belongs to' do
      expect(page).to have_content("Project Name: #{@news_chic.name}")
      expect(page).to have_content("Material: #{@news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    end
  end
end