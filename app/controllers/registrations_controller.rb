class RegistrationsController < Devise::RegistrationsController

    def create
        super
    end

    protected

        def after_sign_up_path_for(resource)
            after_signup_path(:basic_info)
        end
end
