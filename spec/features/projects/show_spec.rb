
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
require 'rails_helper'

RSpec.describe 'the Project show page' do
  let!(recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }
  let!(furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }

  let!(news_chic) { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }
  let!(boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") }

  let!(upholstery_tux) { furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch") }
  let!(lit_fit) { furniture_challenge.projects.create(name: "Litfit", material: "Lamp") }

  describe 'displays the project attributes' do
    it "should display all of the project's attributes" do
      visit "/project/#{news_chic.id}"

      expect(page).to have_content(news_chic.name)
      expect(page).to have_content(news_chic.material)
      expect(page).to have_content(news_chic.material)
      expect(page).to have_content(news_chic.challenge.theme)
    end
  end
end
