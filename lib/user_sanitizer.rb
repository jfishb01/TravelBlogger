class UserParameterSanitizer < Devise::ParameterSanitizer

    def account_update
      default_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end

    def sign_up
      default_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :terms_of_service)
    end

    def sign_in
     default_params.permit(:email, :password)
    end
end
