require 'rails_helper'

describe Member, type: :model do
    it "has a valid factory" do
        expect(build(:member)).to be_valid
    end

    it "has an invalid factory" do
        expect(build(:invalid_member)).not_to be_valid
    end

    it { should have_one :profile }
end
