require "rails_helper"

RSpec.describe "Contestants Index" do
  let!(:contestant_1) { Contestant.create!(name: "Kentaro Kameyama", age: 35, hometown: "Okinawa, Japan", years_of_experience: 25) }
  let!(:contestant_2) { Contestant.create!(name: "Jay McCarroll", age: 21, hometown: "Los Angeles, California", years_of_experience: 3) }

  let!(:challenge_1) { Challenge.create!(theme: "Apartment Furnishing", project_budget: 1000)}
  let!(:challenge_2) { Challenge.create!(theme: "Party Clothes", project_budget: 500)}

  let!(:project_1) { Project.create!(name: "Litfit", material: "Lamp Shade", challenge: challenge_1 ) }
  let!(:project_2) { Project.create!(name: "LeatherFeather", material: "Leather", challenge: challenge_2) }
  let!(:project_3) { Project.create!(name: "Rug Tuxedo", material: "Rug", challenge: challenge_1) }

  before do
    ContestantProject.create!(contestant: contestant_1, project: project_1)
    ContestantProject.create!(contestant: contestant_1, project: project_3)

    ContestantProject.create!(contestant: contestant_2, project: project_2)
  end
  describe "As a visitor, when I visit a '/contestants'" do
    it "displays a list of names of all contestants with a list of contestants project names" do
      visit "/contestants"

      expect(page).to have_content(contestant_1.name)
      expect(page).to have_content(project_1.name)
      expect(page).to have_content(project_3.name)
      expect(page).to have_content(contestant_2.name)
      expect(page).to have_content(project_2.name)
    end
  end
end