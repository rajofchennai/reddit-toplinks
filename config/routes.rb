RedditToplinks::Application.routes.draw do
  root :to => 'reddit#index', :via => :get
  match "/reddit/top_url" => 'reddit#top_url', :via => :get
  match "*anything" => 'reddit#index', :via => :get
  match "*anything" => 'application#error_routing'
  root :to => 'application#error_routing'
end
