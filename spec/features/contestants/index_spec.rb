require 'rails_helper'

RSpec.describe 'contestants index page' do
  before(:each) do
    test_data

    visit '/contestants'
  end
  
  describe 'When I visit the contestants index page' do
    it 'I see a list of names of all the contestants 
      and under each contestants name I see a list of the projects' do
    
      expect(page).to have_content("Name: #{@jay.name}")
      expect(page).to have_content("#{@news_chic.name}")
      expect(page).to have_content("#{@boardfit.name}")
      expect(page).to have_content("Name: #{@gretchen.name}")
      expect(page).to have_content("#{@upholstery_tux.name}")
    end
  end
end
