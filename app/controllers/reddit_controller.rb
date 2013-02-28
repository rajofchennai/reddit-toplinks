class RedditController < ApplicationController
  MAX_PAGES = 3
  PAGE_SIZE = 15
  def index
    redirect_to '/reddit/top_url'
  end

  def top_url
    if params[:page]
      @page = params[:page].to_i
      unless(@page >=1 && @page <= MAX_PAGES)
        @page = 1
      end
    else
      @page = 1
    end

    @top_feeds = JSON.parse(RestClient.get("http://www.reddit.com/top.json?limit=#{MAX_PAGES*PAGE_SIZE}"))['data']['children']

    @feeds = top_feeds[(@page-1)*PAGE_SIZE..(@page*PAGE_SIZE - 1)]
  end
end
