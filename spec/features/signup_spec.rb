require 'rails_helper'

feature "signing up" do
    let(:guest) { build_stubbed(:member) }

    def fill_in_signup_fields
        fill_in "member[email]",                    with: guest.email
        fill_in "member[password]",                 with: guest.password
        fill_in "member[password_confirmation]",    with: guest.password

        # TODO - More stuff here

        click_button "Sign up"
    end

    scenario "visiting the site to sign up", js: true do
        visit root_path
        click_link "Sign up!"
        fill_in_signup_fields
        expect(page).to have_content("You have signed up successfully") # registered successfully??
    end
end
