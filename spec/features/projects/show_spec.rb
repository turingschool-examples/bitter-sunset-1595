require 'rails_helper'

RSpec.describe 'the project show page' do
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

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
  end

  it 'should display a project name + materials and the challenge theme' do
    visit "/projects/#{@lit_fit.id}"

    expect(page).to have_content(@lit_fit.name)
    expect(page).to have_content(@lit_fit.material)
    expect(page).to have_content(@lit_fit.challenge.theme)

    expect(page).to_not have_content(@news_chic.name)
    expect(page).to_not have_content(@news_chic.material)
    expect(page).to_not have_content(@news_chic.challenge.theme)
  end

  it 'should display a count of the number of contestants on the project' do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content(2)

    visit "/projects/#{@upholstery_tux.id}"
    expect(page).to have_content(2)

    visit "/projects/#{@boardfit.id}"
    expect(page).to have_content(1)
  end

  it 'should display the average years of experience for contestants who worked on the project' do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content("12.5 years")

    visit "/projects/#{@upholstery_tux.id}"
    expect(page).to have_content("10.0 years")

    visit "/projects/#{@boardfit.id}"
    expect(page).to have_content("8.0 years")
  end

  it 'should include a form to add a contestant to the given project' do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content(2)

    expect(page).to have_content("Add a Contestant to This Project")
    expect(page).to have_field(:contestant_id)

    fill_in :contestant_id, with: @kentaro.id
    click_button("Add Contestant To Project")

    expect(current_path).to eq("/projects/#{@news_chic.id}")
    expect(page).to have_content(3)

    visit "/contestants"

    within("#contestant-#{@kentaro.id}") do
      expect(page).to have_content(@boardfit.name)
      expect(page).to have_content(@upholstery_tux.name)
      expect(page).to have_content(@news_chic.name)
    end
  end
end
