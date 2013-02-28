class RedditController < ApplicationController
  def index
    redirect_to '/reddit/top_url'
  end

  def top_url
  end
end
