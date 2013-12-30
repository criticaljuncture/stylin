module Stylin
  class Engine < ::Rails::Engine
    isolate_namespace Stylin

    initializer "my_engine.load_app_root" do |app|
      config = {
        stylesheets_path: File.join('app', 'assets', 'stylesheets'),
        html_styleguides_path: File.join('app', 'styleguides'),
        section_groupings: nil
      }

      if File.exists?( File.expand_path(File.join('config', 'stylin.yml'), app.root) )
        user_config = HashWithIndifferentAccess.new(
          YAML.load(
            File.read( File.expand_path(File.join('config', 'stylin.yml'), app.root) )
          )
        ).symbolize_keys
      else
        user_config = {}
      end

      Stylin::APP_CONFIG = config.merge( user_config )

      Stylin::APP_CONFIG[:stylesheets_path] = File.expand_path(APP_CONFIG[:stylesheets_path], app.root)
      Stylin::APP_CONFIG[:html_styleguides_path] = File.expand_path(APP_CONFIG[:html_styleguides_path], app.root)
    end

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.autoload_paths << File.expand_path("../lib/tasks/stylin_tasks.rake", __FILE__)
  end
end
