RedditToplinks::Application.routes.draw do
  match "/reddit/top_url" => 'reddit#top_url', :via => :get
  match "/login" => 'session#login', :via => :get
  match "/logout" => 'session#logout', :via => :get
  match "/signin" => 'session#signin', :via => :post

  root :to => 'reddit#index', :via => :get
  match "*anything" => 'reddit#index', :via => :get
  match "*anything" => 'application#error_routing'
  root :to => 'application#error_routing'
end
