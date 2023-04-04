require 'rails_helper'

RSpec.describe 'project show page' do
  describe 'as a visitor on the show page' do
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
      ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
      visit "/projects/#{@news_chic.id}"
    end

    it 'displays a project name and material'do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content(@news_chic.material)
    end

    it 'displays challenge theme' do
    visit "/projects/#{@news_chic.id}"
    
    expect(page).to have_content(@recycled_material_challenge.theme)
    end

    it 'displays contestant count' do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content('Count: 2')
    end

    it 'displays average experience' do
    expect(page).to have_content('Average Experience: 12.5')
    end
  end
end