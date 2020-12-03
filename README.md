
# Spree Third Party Service Manager
This spree extension allows the admin to add third party services from backend. It provides an interface to manage the third party services and the pages on which these services will run by creating, editing, deleting and enabling them.

## Demo

Try Spree Third Party Service Manager for Spree 4-0 and later with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinsol-spree-contrib/spree-demo-heroku/tree/spree-third-party-service-manager-4-0)

Try Spree Third Party Service Manager for Spree 3-6 with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinsol-spree-contrib/spree-demo-heroku/tree/spree-third-party-service-manager-3-6)

Try Spree Third Party Service Manager for Spree 3-4 with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinsol-spree-contrib/spree-demo-heroku/tree/spree-third-party-service-manager-3-4)

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_third_party_service_manager', github: 'vinsol-spree-contrib/spree_third_party_service_manager'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_third_party_service_manager:install
  ```

4. Run the rake task to add existing spree pages.
  ```ruby
  bundle exec rake spree_pages:populate
  ```

5. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_third_party_service_manager/factories'
```

## See It In Action

<a href="http://www.youtube.com/watch?feature=player_embedded&v=GRrUOggtMqk
" target="_blank"><img src="http://img.youtube.com/vi/GRrUOggtMqk/0.jpg"
alt="Youtube Video Tutorial" /></a>

## Contributing

1. Fork the repo.
2. Clone your repo.
3. Run `bundle install`.
4. Run `bundle exec rake test_app` to create the test application in `spec/test_app`.
5. Make your changes.
6. Ensure specs pass by running `bundle exec rspec spec`.
7. Submit your pull request.

## Credits

[![vinsol.com: Ruby on Rails, iOS and Android developers](http://vinsol.com/vin_logo.png "Ruby on Rails, iOS and Android developers")](http://vinsol.com)

Copyright (c) 2018 [vinsol.com](http://vinsol.com "Ruby on Rails, iOS and Android developers"), released under the [BSD-3-Clause License](https://opensource.org/licenses/BSD-3-Clause)

