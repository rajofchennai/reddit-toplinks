class SessionController < ApplicationController
  def login
  end

  def signin
    session[:email] = params[:email]
    unless User.find_by_email params[:email]
      User.create(:email => params[:email])
    end

    redirect_to "/reddit/top_url"
  end

  def logout
    session[:email] = nil
    redirect_to "/reddit/top_url"
  end
end
