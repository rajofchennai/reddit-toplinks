reddit-toplinks
===============

Simple web app to see top stories on reddit

setup
=====

* rvm install ruby-1.9.3-p362
* rvm use ruby-1.9.3-p362
* rvm gemset create reddit
* rvm gemset use reddit
* gem install bundler
* bundle install
* bundle exec rake db:migrate

Specs
=====

* bundle exec rspec

Running the app
===============

* bundle exec rails s

Default port: 3000
