require 'rails_helper'

RSpec.describe 'Projects Show Page' do
  Project.all.each do |project|
    before(:each) do
      visit "/projects/#{project.id}"
    end

    it 'shows the projects information' do
      expect(page).to have_content(project.name)
      expect(page).to have_content("Material: #{project.material}")
    end

    it 'shows the project challenge theme' do
      expect(page).to have_content("Challenge Theme: #{project.challenge.theme}")
    end

    it 'shows the number of contestants on the project' do
      expect(page).to have_content("Number of Contestants: #{project.contestant_count}")
    end
  end
end
