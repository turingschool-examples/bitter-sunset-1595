require 'rails_helper'

RSpec.describe 'Project Show Page' do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13, projects: [@news_chic])
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12, projects: [@news_chic, @upholstery_tux])
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8, projects: [@upholstery_tux, @boardfit])
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15, projects: [@boardfit])
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

  it 'USE 1: I can see the average years of experience for the contestants that worked on that project' do
    visit "projects/#{@news_chic.id}"

    expect(page).to have_content("Average Contestant Experience: #{@news_chic.contestants.average(:years_of_experience)}")
  end

  it 'USE 2: I can add contestants to a project' do
    visit "projects/#{@news_chic.id}"

    fill_in 'contestant_id', with: @jay.id
    click_button 'Add Contestant To Project'

    expect(page).to have_content('Contestant is already on this project')
    expect(page).to have_content('Number of Contestants: 2')

    fill_in 'contestant_id', with: -1
    click_button 'Add Contestant To Project'

    expect(page).to have_content('Contestant does not exist')

    fill_in 'contestant_id', with: @kentaro.id
    click_button 'Add Contestant To Project'

    expect(page).to have_content('Contestant added to project')
    expect(page).to have_content('Number of Contestants: 3')
  end
end