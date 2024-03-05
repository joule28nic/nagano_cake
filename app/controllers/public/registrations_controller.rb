# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def after_sign_up_path_for(resource)
    my_page_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active])
  end
end
