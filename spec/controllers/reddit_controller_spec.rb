describe RedditController do
  describe "top_url" do
    context "page number" do
      it "page number 1 to max pages should be unchanged" do
        get "top_url", page: 1
        assigns(:page).should == 1
        get "top_url", page: 3
        assigns(:page).should == 3
      end

      it "invalid input should default to 1" do
        get "top_url", page: "abc"
        assigns(:page).should == 1
      end

      it "valid input outside 1..max pages should default to 1" do
        get "top_url", page: 100
        assigns(:page).should == 1
        get "top_url", page: -1
        assigns(:page).should == 1
      end
    end

    context "pagination" do
      it "page number one should give 0..page_size-1 of the feed" do
        RestClient.expects(:get).with('http://www.reddit.com/top.json?limit=45').returns(sample_feed)
        get 'top_url', page: 1
        assign(:feeds).should == JSON.parse(sample_feed)['data']['children'][0..14]
      end

      it "page number x should (x-1)*page_size..(x*page_size -1) of the feed" do
        RestClient.expects(:get).with('http://www.reddit.com/top.json?limit=45').returns(sample_feed)
        get "top_url", page: 3
        assign(:feeds).should == JSON.parse(sample_feed)['data']['children'][30..44]
      end
    end
  end

  def sample_feed
  end

end
