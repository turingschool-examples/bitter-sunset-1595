require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "#instance methods" do
    before :each do
      test_data
    end

    describe '#project_names' do
      it 'returns the names of the projects that the contestant has worked on' do
        expect(@jay.project_names.sort).to eq(['News Chic'])
        expect(@gretchen.project_names.sort).to eq(['News Chic', 'Upholstery Tuxedo'])
        expect(@kentaro.project_names.sort).to eq(['Boardfit', 'Upholstery Tuxedo'])
      end
    end
  end
end
