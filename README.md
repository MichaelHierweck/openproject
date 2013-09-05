# OpenProject Plugins Plugin

This plugin aims to make writing plugins easier. It provides a generator for creating a basic plugin structure and a module that simplifies setting up the plugin Rails engine. Thus, it is also a dependency for many plugins.

## Usage

Make sure to include the plugins plugin before all other plugins in your Gemfile, otherwise the module used by the plugin Rails engines (`OpenProject::Plugins::ActsAsOpEngine`) is not available when the plugin is being loaded.

### Generator

    bundle exec rails generate open_project:plugin <plugin name> <target folder>

The generator will create a new subfolder within `<target folder>`, named `openproject-<plugin name>`.

Example:

    bundle exec rails generate open_project:plugin xls_export .

### ActsAsOpEngine

The generated engine uses ActsAsOpEngine by default, so just have a look at this file. For more information on how to use ActsAsOpEngine, just see the comments in its [source code](lib/open_project/plugins/acts_as_op_engine.rb. It offers methods to load patches and register assets besides others.

#### Example
```ruby
module OpenProject::RepositoryAuthentication
  class Engine < ::Rails::Engine
    engine_name :openproject_repository_authentication

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-repository_authentication',
             :author_url => 'http://finn.de',
             :requires_openproject => '>= 3.0.0pre6'

    patches [:SysController]
  end
end
```
