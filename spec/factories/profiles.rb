FactoryGirl.define do
    factory :profile do
        association :member
        firstname   { FFaker::Name.first_name   }
        lastname    { FFaker::Name.last_name    }
        location    { FFaker::Address.city      }
        bio         { FFaker::Lorem.paragraph   }

        factory :invalid_profile do
            firstname nil
        end
    end
end
