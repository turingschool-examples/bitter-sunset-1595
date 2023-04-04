require 'rails_helper'

RSpec.describe 'Project Show Page' do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
  end

  describe 'As a visitor, when I visit /projects/:id' do
    it 'I see the name, material and theme of the project' do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content(@news_chic.name)
      expect(page).to have_content(@news_chic.material)
      expect(page).to have_content(@recycled_material_challenge.theme)

      expect(page).to_not have_content(@boardfit.name)
      expect(page).to_not have_content(@furniture_challenge.theme)
    end
  end
end