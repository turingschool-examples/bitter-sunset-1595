require "rails_helper"

RSpec.describe "contestants Index", type: :feature do
  before :each do
    @kentaro = Contestants.create!(name: "Kentaro Kameyama")
    @jay = Contestants.create!(name: "Jay McCarroll")
    @litfit = Projects.create!(name: "Lit fit")
    @rug = Projects.create!(name: "Rug Tuxedo")
    @leather = Projects.create!(name: "LeatherFeather")
  end

  it 'has names of contestants and projects they have done' do
    visit "/contestants"

    expect(page).to have_content()
  end
end