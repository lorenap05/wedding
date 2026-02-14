source "https://rubygems.org"

gem "rails", "~> 7.1.5"
gem "sprockets-rails"
gem "sqlite3", ">= 1.4"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
gem "bootsnap", require: false
gem "bcrypt", "~> 3.1"

unless ENV["RAILS_ENV"] == "production" || ENV["RACK_ENV"] == "production"
  group :development, :test do
    gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
  end
end
