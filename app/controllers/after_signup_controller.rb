class AfterSignupController < ApplicationController
    include Wicked::Wizard

    before_filter :authenticate_member!
    steps :basic_info, :profile_type_choice

    def show
        @profile = current_profile
        render_wizard
    end

    def update
        @profile = current_profile
        case step
            when :basic_info
                @profile.update_attributes(profile_params)
            when :profile_type_choice
                # TODO - Create related profile based on this
                puts "Selected membership type: #{params[:membership][:membership_type]}"
        end

        render_wizard @profile
    end

    # def finish_wizard_path
    #     user_path(current_user)
    # end

    private

        def current_profile
            current_member.profile || current_member.create_profile
        end

        def profile_params
            params.require(:profile).permit(:firstname, :lastname, :location, :bio)
        end
end
