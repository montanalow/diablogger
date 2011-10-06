class ApplicationController < ActionController::Base
  protect_from_forgery

  def request_user
    User.get 1
  end
end
