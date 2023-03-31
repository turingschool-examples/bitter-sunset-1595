require 'rails_helper'

RSpec.describe "Project Show page" do

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
  end

  describe "diplays attributes" do
    it "displays projects name and material" do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content("Boardfit")
      expect(page).to have_content("Cardboard Boxes")
    end
  end

end