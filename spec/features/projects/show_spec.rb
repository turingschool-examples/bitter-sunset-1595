require 'rails_helper'

RSpec.describe 'projects/show page' do
  before(:each) do
    test_data

    visit "/projects/#{@news_chic.id}"
  end

  describe 'When I visit a projects show page' do
    it 'I see that projects name and material' do
      expect(page).to have_content("Project Name: #{@news_chic.name}")
      expect(page).to have_content("Material: #{@news_chic.material}")
      expect(page).to_not have_content("Name: #{@upholstery_tux.name}")
    end

    it 'I also see the theme of the challenge that this project belongs to' do
      expect(page).to have_content("Project Name: #{@news_chic.name}")
      expect(page).to have_content("Material: #{@news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    end

    it 'I see a count of the number of contestants on this project' do
      save_and_open_page
      expect(page).to have_content("Number of Contestants: 2")
    end
  end
end