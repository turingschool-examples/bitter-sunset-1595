require "rails_helper"

RSpec.describe "Projects Show", type: :feature do
  before :each do
    @litfit = Projects.create!(name: "LitFit", material: "Lamp Shade")
    @furnishings = Challenges.create!(name: "Apartment Furnishings")
  end

  it 'shows projects name, material, and challenge theme' do
    visit "/projects/#{@litfit.id}"

    expect(page).to have_content(@litfit.id)
    expect(page).to have_content(@litfit.name)
    expect(page).to have_content(@litfit.material)
    expect(page).to have_content(@furnishings.name)
  end

end