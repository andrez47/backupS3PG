class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :verify_access

  def verify_access
    authenticate_or_request_with_http_basic("BackupS3PG") do |username, password|
      username == "backup" and password == "costarica"
    end
  end
end
