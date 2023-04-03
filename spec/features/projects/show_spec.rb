require 'rails_helper'

RSpec.describe 'the Project Show page' do
  before(:each) do
    test_data

    visit "/projects/#{@boardfit.id}"
  end

  describe 'User Story 1' do
    it 'displays the project name and material and the challenge theme' do
      expect(page).to have_content(@boardfit.name)
      expect(page).to have_content("Material: #{@boardfit.material}")
      expect(page).to have_content("Challenge Theme: #{@boardfit.challenge.theme}")
    end
  end

  describe 'User Story 3' do
    it 'displays the number of contestants on each project' do
      expect(page).to have_content("Number of Contestants: #{@boardfit.contestants.size}")
    end
  end

  describe 'Extension 1' do
    it 'displays the number of contestants on each project' do
      expect(page).to have_content("Average Contestant Experience: #{@boardfit.average_experience}")
    end
  end

  describe 'Extension 2' do
    it 'displays the form to add a contestant' do
      expect(page).to have_content('Add a Contestant')
      expect(page).to have_field('Contestant ID')
      expect(page).to have_button('Add Contestant to Project')
    end

    it 'adds a contestant to the project' do
      fill_in(:contestant_id, with: 1)
      click_on('Add Contestant to Project')

      expect(current_path).to eq("/projects/#{@boardfit.id}")
      expect(page).to have_content('Number of Contestants: 3')

      visit '/contestants'

      expect(page).to have_content("Jay McCarroll\nProjects: News Chic, Boardfit")
    end
  end
end
