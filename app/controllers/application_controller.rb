class ApplicationController < ActionController::Base
  protect_from_forgery
  def error_routing
    render :text => "page not found" , :status => 404
  end
end
