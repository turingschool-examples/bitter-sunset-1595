require 'rails_helper'

RSpec.describe 'Project Show Page' do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  it 'US 1: I can see the project name and material and theme' do
    visit "projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content(@news_chic.material)
    expect(page).to have_content(@news_chic.challenge.theme)
  end

  it 'US 3: I can see the count of contestants on this project' do
    visit "projects/#{@news_chic.id}"

    expect(page).to have_content("Number of Contestants: #{@news_chic.contestants.count}")
  end
end