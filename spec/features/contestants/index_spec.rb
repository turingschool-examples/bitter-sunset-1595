require 'rails_helper'

RSpec.describe 'contestants index page' do
  before :each do
    test_data
    visit '/contestants'
  end

  describe "As a visitor, when I visit the contestants index page" do
    it "shows me a list of names of all the contestants" do
      within("#contestant-#{@jay.id}") do
        expect(page).to have_content("Jay McCarroll")
      end
      within("#contestant-#{@gretchen.id}") do
        expect(page).to have_content("Gretchen Jones")
      end
      within("#contestant-#{@kentaro.id}") do
        expect(page).to have_content("Kentaro Kameyama")
      end
      within("#contestant-#{@erin.id}") do
        expect(page).to have_content("Erin Robertson")
      end
    end

    it "under each contestant it lists the names of the projects that they've been on" do
      within("#contestant-#{@jay.id}") do
        expect(page).to have_content("News Chic")
      end
      within("#contestant-#{@gretchen.id}") do
        expect(page).to have_content("News Chic")
        expect(page).to have_content("Upholstery Tuxedo")
      end

    end
  end
end