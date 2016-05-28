FactoryGirl.define do
    factory :member do
        email     { FFaker::Internet.email }
        password  { Devise.friendly_token.first(8) }

        after(:build) do |member|
            member.profile = build(:profile, member: member)
        end

        factory :invalid_member do
            email nil
        end

        # factory :admin do
        #     admin true
        # end
    end
end
