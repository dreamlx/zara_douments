source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use sqlite3 as the database for Active Record
group :production do
#  gem "pg"
end

group :development do
  # ...

  # 其中`capistrano-rails`包含了以下三个插件。
  # gem 'capistrano/bundler'
  # gem 'capistrano/rails/assets'
  # gem 'capistrano/rails/migrations'
  # 你也可以分别一个个加进去，但是何必呢？这些基本都是`rails`部署必须的。
  # 直接用`gem 'capistrano-rails'`这一个就好了。
  gem 'capistrano-rails'

  # 对`passenger`与`rbenv`的支持
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
end

group :development, :test do
  gem "sqlite3"
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'thin'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# my gems
gem 'devise'
gem 'activeadmin'
gem 'cancan'

