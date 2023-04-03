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

  describe 'instance methods' do
    before(:each) do
      test_data
    end

    describe '#average_experience' do
      it 'averages all contestants years of experience' do
        expect(@news_chic.average_experience).to eq(12.5)
        expect(@boardfit.average_experience).to eq(11.5)
      end

      it 'returns zero if no contestants are on the project' do
        expect(@lit_fit.average_experience).to eq(0)
      end
    end
  end
end
