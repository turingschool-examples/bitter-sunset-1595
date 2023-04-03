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
end
