require 'rails_helper'

RSpec.describe 'Project show page' do
  before(:each) do
    @challenge = Challenge.create!(theme: "Derelicte", project_budget: 1000)
    @project = @challenge.projects.create!(name: "Zoolander", material: "Garbage")
  end
  
  describe 'as a visitor' do
    it 'shows the project name, material, and challenge theme' do
      visit "/projects/#{@project.id}"
      
      expect(page).to have_content(@project.name)
      expect(page).to have_content(@project.material)
      expect(page).to have_content(@project.challenge.theme)
    end
  end
  
  describe 'as a visitor' do
    it 'shows the number of contestants on the project' do
      @contestant_1 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Denver", years_of_experience: 10)
      @contestant_2 = Contestant.create!(name: "Jay McCarroll", age: 36, hometown: "New York City", years_of_experience: 12)
      @contestant_3 = Contestant.create!(name: "Uli Herzner", age: 34, hometown: "Boston", years_of_experience: 15)
      
      @contestant_1.projects << @project
      @contestant_2.projects << @project
      @contestant_3.projects << @project
      
      visit "/projects/#{@project.id}"
      
      expect(page).to have_content("Number of Contestants: 3")
    end

    it 'shows the avg years experience of the contestants on project' do
      @contestant_1 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Denver", years_of_experience: 10)
      @contestant_2 = Contestant.create!(name: "Jay McCarroll", age: 36, hometown: "New York City", years_of_experience: 12)
      @contestant_3 = Contestant.create!(name: "Uli Herzner", age: 34, hometown: "Boston", years_of_experience: 15)
      @contestant_1.projects << @project
      @contestant_2.projects << @project
      @contestant_3.projects << @project
      
      visit "/projects/#{@project.id}"

      expect(page).to have_content("Average years of experience on team: 12 years")
      # Struggling to call .round on @project.contestants.average(:years_of_experience)
      # returns the float as NilClass, but when I check in a pry, it returns the correct
      # value (12.33333), so I called .to_i and just rounded down for the sake of passing
      # the test. I'm sure there's a better way to do this, but I'm not sure what it is.
    end
  end
end