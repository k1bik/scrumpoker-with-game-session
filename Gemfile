source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.1.3.2"
gem "sprockets-rails"
gem "pg", "~> 1.5", ">= 1.5.6"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "friendly_id", "~> 5.5.0"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false
gem "view_component"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.1.0"
  gem "factory_bot_rails"
  gem "standard"
end

group :development do
  gem "web-console"
end

group :test do
  gem "shoulda-matchers"
  gem "rails-controller-testing"
end
