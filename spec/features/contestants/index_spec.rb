require 'rails_helper'

RSpec.describe 'the Contestant Index page' do
  before(:each) do
    test_data

    visit '/contestants'
  end

  describe 'User Story 2' do
    it 'lists all contestant names and their projects' do      
      expect(page).to have_content(@jay.name)
      expect(page).to have_content('Projects: News Chic')
      expect(page).to have_content(@gretchen.name)
      expect(page).to have_content('Projects: News Chic, Upholstery Tux')
      expect(page).to have_content(@kentaro.name)
      expect(page).to have_content('Projects: Boardfit, Upholstery Tux')
      expect(page).to have_content(@erin.name)
      expect(page).to have_content('Projects: Boardfit')
    end
  end
end
