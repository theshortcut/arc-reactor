GIT_PROTOCOL = ENV['http_proxy'] ? 'http' : 'git'

source 'http://rubygems.org'

gem 'sinatra',        :git => "#{GIT_PROTOCOL}://github.com/sinatra/sinatra.git"
gem 'sinatra-cache',  :git => "#{GIT_PROTOCOL}://github.com/kematzy/sinatra-cache.git"
gem 'haml',           :git => "#{GIT_PROTOCOL}://github.com/nex3/haml.git"
gem 'compass',        :git => "#{GIT_PROTOCOL}://github.com/chriseppstein/compass.git"
gem 'coffee-script'
gem 'rake'

group :test do
  gem 'rack-test'
  gem 'contest',      :git => "#{GIT_PROTOCOL}://github.com/theshortcut/contest.git"
end
