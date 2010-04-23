# Edit this Gemfile to bundle your application's dependencies.

source 'http://gemcutter.org'

require File.expand_path('../rails3beta2fixes', __FILE__)
gem "rails", "3.0.0.beta"

gem "pg"
gem "haml"
gem 'paperclip', :git => 'git://github.com/JasonKing/paperclip.git', :branch => 'rails3'
gem "authlogic", :git => 'git://github.com/binarylogic/authlogic.git'

## Bundle edge rails:
# gem "rails", :git => "git://github.com/rails/rails.git"

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
#gem "sqlite3-ruby", :require => "sqlite3"
gem "mysql", ">=2.7.0"
## Bundle the gems you use:
# gem "bj"
# gem "hpricot", "0.6"
# gem "sqlite3-ruby", :require => "sqlite3"
# gem "aws-s3", :require => "aws/s3"

## Bundle gems used only in certain environments:
# gem "rspec", :group => :test
# group :test do
#   gem "webrat"
# end

group :test do
  # BDD stuff
  gem "factory_girl",     :git => "git://github.com/szimek/factory_girl.git",          :branch => "rails3"
  gem "capybara",         :git => "git://github.com/jnicklas/capybara.git",            :branch => "master"
  gem "database_cleaner", :git => "git://github.com/bmabey/database_cleaner.git",      :branch => "master"
  gem "cucumber",         :git => "git://github.com/aslakhellesoy/cucumber.git",       :branch => "master"
  gem "cucumber-rails",   :git => "git://github.com/aslakhellesoy/cucumber-rails.git", :branch => "master"
  gem "rspec-rails", "2.0.0.beta.4" #     :git => "git://github.com/rspec/rspec-rails.git",            :branch => "master"
  gem "faker"
  gem "launchy"
end
