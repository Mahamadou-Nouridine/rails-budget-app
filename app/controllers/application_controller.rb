class ApplicationController < ActionController::Base
  before_action :set_variables

  def set_variables
    @current_user = current_user
  end

  def current_user
    User.first
  end
end
