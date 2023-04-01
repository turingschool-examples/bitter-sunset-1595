require 'rails_helper'

RSpec.describe '/projects/:id', type: :feature do
  describe 'As a visitory when I visit a projects show page' do
    before(:each) do
      @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
      @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")

      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

      ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
      ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    end

    it 'I can see that projects name, material and the challenge theme' do
      visit "/projects/#{@upholstery_tux.id}"

      expect(page).to have_content("Project Upholstery Tuxedo")
      expect(page).to have_content("Material: Couch")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end

    it 'I see a count of the number of contestants on this project' do
      visit "projects/#{@upholstery_tux.id}"

      expect(page).to have_content("Number of Contestants: 2")
    end

    it 'I see average years of experience for the contestants on this project' do
      visit "projects/#{@upholstery_tux.id}"
      
      expect(page).to have_content("Average Contestant Experience: 10.0 years")
    end

    describe 'User Story Extension 2' do
      it 'I see a form to add a contestant to this project' do
        visit "projects/#{@upholstery_tux.id}"

        expect(page).to have_content('Contestant ID')
        expect(page).to have_field('contestant_id')
        expect(page).to have_button('Add Contestant To Project')

        fill_in 'contestant_id', with: "#{@erin.id}"
        click_button 'Add Contestant To Project'

        expect(current_path).to eq("projects/#{@upholstery_tux.id}")
        expect(page).to have_content("Number of Contestants: 3")
        
        visit "/contestants"
        expect(page).to have_content(@erin.name)
        expect(@upholstery_tux.name).to appear_after(@erin.name)
        save_and_open_page
      end
    end
  end
end