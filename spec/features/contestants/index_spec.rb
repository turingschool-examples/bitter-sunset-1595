require 'rails_helper'

RSpec.describe "Contestants Index Page", type: :feature do
  before(:each) do
    @challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @project_1 = @challenge.projects.create!(name: "News Chic", material: "Newspaper")
    @project_2 = @challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
    @project_3 = @challenge.projects.create!(name: "Rug Tuxedo", material: "Couch")

    @contestant_1 = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @contestant_2 = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @contestant_3 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @contestant_4 = Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    
  end

  it 'can see a list of all contestants and their project names' do
    visit '/contestants'

    expect(page).to have_content()
  end
end