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

  Contestant.all.each_with_index do |contestant, i|
    it 'has a form to add a contestant to the project' do
      visit "/projects/#{@lit_fit.id}"

      fill_in("Contestant id", with: contestant.id)
      click_button("Add Contestant")

      expect(current_path).to eq("/projects/#{@lit_fit.id}")
      expect(page).to have_content("Number of Contestants: #{i + 1}")

      value = @lit_fit.contestants.pluck(:years_of_experience).sum.fdiv(i + 1)
      average_contestant_experience = value.nan? ? 0 : value

      expect(page).to have_content("Average Contestant Experience: #{average_contestant_experience}")
    end
  end

  it 'shows the project under the contestant\'s name after adding the contestant to the project' do
    visit "/projects/#{@lit_fit.id}"

    fill_in("Contestant id", with: @kentaro.id)
    click_button("Add Contestant To Project")

    visit "/contestants"

    expect(page).to have_content(@lit_fit.name)
    expect(@kentaro.name).to appear_before(@lit_fit.name)
  end
end
