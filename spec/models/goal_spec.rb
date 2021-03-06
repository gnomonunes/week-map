require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should belong_to(:week) }

  describe ".new" do
    context "goal has valid data" do
      let(:week) { Week.new }
      let(:goal) { Goal.new({description: 'do the laundry', week: week}) }

      it "is valid" do
        expect(goal).to be_valid
      end
    end

    context "goal has invalid data" do
      let(:goal) { Goal.new }

      it "is invalid" do
        expect(goal).to be_invalid
      end
    end
  end
end
