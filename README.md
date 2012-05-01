# app-yml-rails

This gem provides a Rails application with project-wide settings via an **app.yml** file. Settings can be accessed anywhere: controllers, helpers, views, models, tests, in the console, etc.

## Features

- Provides project-wide settings via **config/app.yml**.
- Supports `App.settings.nested_settings` syntax.
- Supports **all/production/staging/development/test** environments (specific environment settings over settings from the 'all' environment).
- Auto-refreshes **app.yml** changes without requiring an application restart.

## Installation

Add the following line to your project's **Gemfile**:

    gem 'app-yml-rails'

Install the gem using **Bundler**:

    $ bundle

Install the config and initializer files:

    $ rails generate app_yml:install

## Usage

1. Edit your project settings in **config/app.yml**.
2. Access settings anywhere in your application via `App.settings.nested_setting` syntax.

## Examples

If your **config/app.yml** file appears as follows:

    all:
      emails:
        admin: admin@example.com
        team:
          ceo: ceo@example.com
      max_search_results: 20
      app_name: My Amazing Application

    development:
      emails:
        team:
          ceo: ceo@localhost
      app_name: My Amazing Application (development)

    production:
      app_name: My Amazing Application (production)

Settings in the **development** environment:

    App.emails.admin       => 'admin@example.com'
    App.emails.team.ceo    => 'ceo@localhost'
    App.max_search_results => 20
    App.app_name           => 'My Amazing Application (development)'

Settings in the **production** environment:

    App.emails.admin       => 'admin@example.com'
    App.emails.team.ceo    => 'ceo@example.com'
    App.max_search_results => 20
    App.app_name           => 'My Amazing Application (production)'

## License

[MIT License](https://github.com/thinkswan/app-yml-rails/blob/master/MIT-LICENSE)
