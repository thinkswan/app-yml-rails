## 0.1.1 (May 1, 2012)

**Bug Fixes:**

  - Fixed the `Hash.deep_update!` bug that prevented the Rails' server from booting
  - Settings for a specific environment which are *not* defined in the **'all'** environment are now included


## 0.1.0 (Apr 30, 2012)

**Features:**

  - Provides project-wide settings via `config/app.yml`
  - Supports `App.settings.nested_settings` syntax
  - Supports all/production/staging/development/test environments (specific environment settings over settings from the 'all' environment)
  - Auto-refreshes `app.yml` changes without requiring an application restart
