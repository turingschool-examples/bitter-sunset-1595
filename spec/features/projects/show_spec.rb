require 'rails_helper'

RSpec.describe 'the Project Show page' do
  before(:each) do
    test_data

    visit "/projects/#{@lit_fit.id}"
  end

  describe 'User Story 1' do
    it 'displays the project name and material and the challenge theme' do
      expect(page).to have_content(@lit_fit.name)
      expect(page).to have_content("Material: #{@lit_fit.material}")
      expect(page).to have_content("Challenge Theme: #{@lit_fit.challenge.theme}")
    end
  end
end
