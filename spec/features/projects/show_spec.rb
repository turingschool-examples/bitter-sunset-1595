require 'rails_helper'

Rspec.describe 'Project Show Page' do

#   recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
#   

# news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
# boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

# upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
# 
# When I visit a project's show page ("/projects/:id"),

# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
  it "displays project's name, material, and it's challenge's theme" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
   
    visit "/projects/#{news_chic.id}"

    expect(page).to have_content(news_chic.name)
    expect(page).to have_content(news_chic.material)
    expect(page).to have_content("Challenge Theme: #{news_chic.challenge_id}")
  end
end