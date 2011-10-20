source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'less-rails-bootstrap'
end

gem 'jquery-rails'

group :development do
  gem "therubyracer"
  gem "database_cleaner"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test, :development do
  gem "rspec-rails"
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "guard-rspec"  
end

group :test do
  gem "capybara"
  gem "cucumber-rails"
  gem "factory_girl_rails"
end

