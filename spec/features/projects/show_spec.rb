require 'rails_helper'

RSpec.describe "Project Show page" do

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
  end

  describe "diplays attributes and challenge theme" do
    it "displays projects name and material" do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content("Boardfit")
      expect(page).to have_content("Cardboard Boxes")
      expect(page).to_not have_content(@news_chic.name)
    end

    it "displays theme of challenge it belongs to" do
      visit "/projects/#{@boardfit.id}"
      require 'pry'; binding.pry
      expect(page).to have_content(@recycled_material_challenge.theme)
    end
  end

end