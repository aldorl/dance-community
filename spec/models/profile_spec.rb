require 'rails_helper'

describe Profile, type: :model do
    it "has a valid factory" do
        expect(build(:profile)).to be_valid
    end

    it "has an invalid factory" do
        expect(build(:invalid_profile)).not_to be_valid
    end

    it { should belong_to               :member }
    it { should validate_presence_of    :firstname }
    it { should validate_presence_of    :lastname }
end
