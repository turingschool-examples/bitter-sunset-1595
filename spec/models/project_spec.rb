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

  Project.all.each do |project|
    describe "instance methods" do
      describe "#contestant_count" do
        it "returns the number of contestants for the project" do
          expect(project.contestant_count).to eq(project.contestants.size)
        end
      end

      describe "#average_contestant_experience" do
        it "returns the average number of years of experience of all the contestants on the project" do
          expect(project.average_contestant_experience).to eq(project.contestants.pluck(:years_of_experience).sum.fdiv(project.contestants.size))
        end
      end
    end
  end
end
