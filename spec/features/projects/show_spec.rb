require "rails_helper"

RSpec.describe "Project Show" do
  let!(:challenge_1) { Challenge.create!(theme: "Apartment Furnishing", project_budget: 1000)}
  let!(:challenge_2) { Challenge.create!(theme: "Party Clothes", project_budget: 500)}
  let!(:project_1) { Project.create!(name: "Litfit", material: "Lamp Shade", challenge: challenge_1 ) }
  let!(:project_2) { Project.create!(name: "LeatherFeather", material: "Leather", challenge: challenge_2) }
  let!(:project_3) { Project.create!(name: "Rug Tuxedo", material: "Rug", challenge: challenge_1) }
  
  describe "As a visitor, when I visit a /projects/:id" do
    it "shows projects name and material and theme of challenge that project belongs to" do
      visit "/projects/#{project_1.id}"

      expect(page).to have_content(project_1.name)
      expect(page).to have_content(project_1.material)
      expect(page).to have_content(challenge_1.theme)
      expect(page).to have_content(challenge_1.project_budget)
    end
  end
end