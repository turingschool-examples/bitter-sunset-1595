require 'rails_helper'

RSpec.describe 'Project show page' do
  describe 'as a visitor' do
    it 'shows the project name, material, and challenge theme' do
      challenge = Challenge.create!(theme: "Derelicte", project_budget: 1000)
      project = challenge.projects.create!(name: "Zoolander", material: "Garbage")
      visit "/projects/#{project.id}"
      save_and_open_page
      expect(page).to have_content(project.name)
      expect(page).to have_content(project.material)
      expect(page).to have_content(project.challenge.theme)
    end
  end
end