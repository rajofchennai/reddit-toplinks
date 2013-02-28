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

    # params of page is mainly to track the current page
    if params[:page].to_i == 0
      @page = 1
    else
      @page = params[:page].to_i
    end

    if @page <= MAX_PAGES && @page > 0
      @feeds = JSON.parse(RestClient.get("http://www.reddit.com/top.json?#{parameters}"))['data']['children']
      @previous_page = "/reddit/top_url?before=#{@feeds[0]['data']['name']}&page=#{@page-1}"
      @next_page = "/reddit/top_url?after=#{@feeds.last['data']['name']}&page=#{@page+1}"
    end
  end
end
