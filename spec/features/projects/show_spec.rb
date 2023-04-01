require 'rails_helper'

RSpec.describe "/projects/:id" do
  before do
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
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  it "shows a project's name and material" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("News Chic")
    expect(page).to have_content("Material: Newspaper")

    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Upholstery Tuxedo")
    expect(page).to have_content("Material: Couch")
  end

  it "has theme of challenge to which it belongs" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Challenge Theme: Recycled Material")

    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Challenge Theme: Apartment Furnishings")
  end

  it "has a count of all contestants on this project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Number of Contestants: 3")

    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end

  it "can show average years of experience for contestants" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Average Contestant Experience: 11")

    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Average Contestant Experience: 11.5")
  end

  it "has a form to add contestant to project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_field("contestant_id")
    expect(page).to have_button("Add Contestant to Project")
    
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_field("contestant_id")
    expect(page).to have_button("Add Contestant to Project")
  end

  it "form adds contestant to project" do
    visit "/contestants"
  
    expect(page).to have_no_content("Boardfit, News Chic")

    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Number of Contestants: 2")

    fill_in("contestant_id", with: @erin.id)
    click_button("Add Contestant to Project")

    expect(page).to have_content("Number of Contestants: 3")

    visit "/contestants"

    expect(page).to have_content("Boardfit, Upholstery Tuxedo")
  end
end