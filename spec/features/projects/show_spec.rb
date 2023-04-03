require 'rails_helper'

RSpec.describe 'Projects Show Page' do
  it 'shows the projects information and challenge theme' do
    visit "/projects/#{@lit_fit.id}"

    expect(page).to have_content("Name: #{@lit_fit.name}")
    expect(page).to have_content("Material: #{@lit_fit.material}")
    expect(page).to have_content("Challenge Theme: #{@lit_fit.challenge.theme}")
  end

  it 'shows another projects information and challenge theme' do
    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Name: #{@boardfit.name}")
    expect(page).to have_content("Material: #{@boardfit.material}")
    expect(page).to have_content("Challenge Theme: #{@boardfit.challenge.theme}")
  end
end
