class AuthController < ApplicationController
  def index
    return unless user_signed_in?

    redirect_to root_path
  end
end
