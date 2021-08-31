# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Ultimate pagination gem that outperforms the others in each and every benchmark and comparison
gem 'pagy'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
gem 'simple_form'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4.0'

group :development, :test do
  # Pretty prints Ruby objects
  gem 'awesome_print'
  # Static analysis tool which checks Ruby on Rails applications for security vulnerabilities
  gem 'brakeman', require: false
  # Gem for environment variables
  gem 'dotenv-rails'
  # Gem for auto-generating data. Important to have it with require: false and load by demand,
  # such as not always needed in dev environment, but it is weighty
  gem 'faker', require: false
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'
  # Brings the RSpec testing framework to the project
  gem 'rspec-rails'
  # Ruby static code analyzer (a.k.a. linter) and code formatter
  gem 'rubocop',             require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails',       require: false
  gem 'rubocop-rspec',       require: false
end

group :development do
  # Add a comment summarizing the current schema on top of your models
  gem 'annotate'
  # Help to kill N+1 queries and unused eager loading
  gem 'bullet'
  # Preview email in the default browser instead of sending it
  gem 'letter_opener'
  # Listens to file modifications and notifies you about the changes.
  # Helps Rails to catch file changes without server restart
  gem 'listen', '~> 3.3'
  # Display performance information such as SQL time and
  # flame graphs for each request in your browser.
  # Can be configured to work on production as well
  # see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Provides test factories
  gem 'factory_bot_rails'
  # This gem brings back assigns to your controller tests as well as assert_template
  # to both controller and integration tests.
  gem 'rails-controller-testing'
  # Adds useful RSpec matchers
  gem 'shoulda-matchers'
  # Gem for freezing time & time travelling in tests
  gem 'timecop'
end
