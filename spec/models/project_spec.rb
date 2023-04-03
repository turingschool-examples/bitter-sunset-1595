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

  describe "instance methods" do
    describe "#contestant_count" do
      it "returns the number of contestants for the project" do
        expect(@news_chic.contestant_count).to eq(2)
        expect(@boardfit.contestant_count).to eq(2)
        expect(@upholstery_tux.contestant_count).to eq(2)
        expect(@lit_fit.contestant_count).to eq(0)
      end
    end
  end
end
