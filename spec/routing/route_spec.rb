require 'spec_helper'

describe "Routes" do
  it "root and any random url except /reddit/top_url should route to reddit index" do
    {:get =>  '/'}.should route_to({:controller => 'reddit', :action => 'index'})
    {:get =>  '/abc'}.should route_to({:controller => 'reddit', :action => 'index', :anything => "abc"})
  end

  it "/reddit/top_url should route to reddit#top_url" do
    {:get => '/reddit/top_url'}.should route_to({:controller => 'reddit', :action => 'top_url'})
  end

  it "all non-get requests should route to application#error_routing" do
    {:post => '/'}.should route_to({:controller => 'application', :action => 'error_routing'})
    {:delete => '/abc'}.should route_to({:controller => 'application', :action => 'error_routing', :anything => 'abc'})
    {:post => '/reddit/top_url'}.should route_to({:controller => 'application', :action => 'error_routing', :anything => 'reddit/top_url'})
  end
end
