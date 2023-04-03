require 'rails_helper'

RSpec.describe Project do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
  end

  it 'has project name and material and challenge theme' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("#{@news_chic.name}")
    expect(page).to have_content("#{@news_chic.material}")
    expect(page).to have_content("Recycled Material")
  end

  it 'shows # of contestants' do
    @news_chic.contestants << @kentaro

    @news_chic.contestants << @gretchen

    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end

  it 'shows average years of experience for contestants' do
    @news_chic.contestants << @kentaro

    @news_chic.contestants << @gretchen
    
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Average Contestant Experience: 10 years")
  end
end