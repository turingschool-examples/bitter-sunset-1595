require 'rails_helper'

RSpec.describe 'Contestants Index Page' do
  before(:each) do
    visit '/contestants'
  end

  it 'shows all the contestant\'s names' do
    expect(page).to have_content(@jay.name)
    expect(page).to have_content(@gretchen.name)
    expect(page).to have_content(@kentaro.name)
    expect(page).to have_content(@erin.name)
  end

  it 'shows all the project names for each contestant' do
    expect(page).to have_content("Projects: #{@jay.projects.pluck(:name).join(', ')}")
    expect(page).to have_content("Projects: #{@gretchen.projects.pluck(:name).join(', ')}")
    expect(page).to have_content("Projects: #{@kentaro.projects.pluck(:name).join(', ')}")
    expect(page).to have_content("Projects: #{@erin.projects.pluck(:name).join(', ')}")
  end
end
