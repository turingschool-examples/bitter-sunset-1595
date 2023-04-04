require 'rails_helper'

RSpec.describe 'projects show page' do
  before :each do
    test_data
    visit "/projects/#{@news_chic.id}"
  end

  describe "As a visitor,when I visit a project's show page," do
    it "shows me that project's name and material" do
      within('#project-info') do 
        expect(page).to have_content("News Chic")
        expect(page).to have_content("Material: Newspaper")
      end
    end

    it "shows me the theme of the challenge it belongs to" do
      within('#project-info') do 
        expect(page).to have_content("Challenge Theme: Recycled Material")
      end
    end
  end
end