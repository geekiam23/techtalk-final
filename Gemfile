source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# ruby 2.5.0
gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.11.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 4.1.8'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails', '~> 4.3.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.4.3'
gem 'paperclip', '~> 5.2.1'
gem 'elasticsearch-model', '~> 5.0.2'
gem 'elasticsearch-rails', '~> 5.0.2'
gem 'faker', '~> 1.8.7'
gem 'foreman', '~> 0.64.0'
gem 'devise_token_auth', '~> 0.1.43'
gem 'omniauth', '~> 1.8.1'
gem 'omniauth-linkedin-oauth2', '~> 0.2.5'
gem 'omniauth-github', '~> 1.0.1'
gem 'omniauth-facebook', '~> 1.4.0'
gem 'omniauth-google-oauth2', '~> 0.2.2'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
