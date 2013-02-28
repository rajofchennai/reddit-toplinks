class RedditController < ApplicationController
  MAX_PAGES = 3
  PAGE_SIZE = 15
  def index
    redirect_to '/reddit/top_url'
  end

  def top_url
    parameters = "limit=#{PAGE_SIZE}"
    parameters << "&after=#{params[:after]}" if params[:after]
    parameters << "&before=#{params[:before]}" if params[:before]
    @page = 1
    @page = params[:page].to_i if params[:page]
    if @page <= MAX_PAGES && @page > 0
      @feeds = JSON.parse(RestClient.get("http://www.reddit.com/top.json?#{parameters}"))['data']['children']
    end
  end
end
