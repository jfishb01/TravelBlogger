class Users::RegistrationsController < Devise::RegistrationsController
  require 'securerandom'

  def update

    # For Rails 4
    # account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    account_update_params = devise_parameter_sanitizer.account_update
    # For Rails 3
    # account_update_params = params[:user]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      # redirect_to after_update_path_for(@user)
      redirect_to :back
    else
      render "edit"
    end
  end


  protected

    def after_inactive_sign_up_path_for(resource)
      resource.update_attribute(:obfuscated_id, SecureRandom.hex)
      confirm_path
    end

end

