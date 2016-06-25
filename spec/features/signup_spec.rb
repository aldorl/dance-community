require 'rails_helper'

feature "signing up" do
    let(:guest)             { build_stubbed(:member) }
    let(:member_profile)    { create(:profile) }

    def fill_in_signup_fields
        fill_in "member[email]",                    with: guest.email
        fill_in "member[password]",                 with: guest.password
        fill_in "member[password_confirmation]",    with: guest.password

        click_button "Sign up"
    end

    def fill_in_basic_info
        fill_in "profile[firstname]",   with: member_profile.firstname
        fill_in "profile[lastname]",    with: member_profile.lastname
        fill_in "profile[location]",    with: member_profile.location
        fill_in "profile[bio]",         with: member_profile.bio

        click_button "Next"
    end

    def choose_profile_type
        select "Dancer", :from => "membership[membership_type]"

        click_button "Finish"
    end

    scenario "visiting the site to sign up", js: true do
        visit root_path
        click_link "Sign up!"

        fill_in_signup_fields
        expect(page).to have_content("You have signed up successfully")

        fill_in_basic_info

        choose_profile_type
        expect(page).to have_content("Welcome to the Dance Community")
        expect(page).to have_content("Logged in user: #{guest.email}")
    end
end
