require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "#instance methods" do
    before :each do
      test_data
    end
    describe '#challenge_theme' do
      it 'should return the theme of the challenge the project belongs to' do
        expect(@news_chic.challenge_theme).to eq("Recycled Material")
      end
    end
    describe '#number_of_contestants' do
      it 'should return the number of contestants that worked on the project' do
        expect(@news_chic.number_of_contestants).to eq(2)
        expect(@upholstery_tux.number_of_contestants).to eq(2)
        expect(@boardfit.number_of_contestants).to eq(2)
        expect(@lit_fit.number_of_contestants).to eq(0)
      end
    end
  end
end
