module Stylin
  class Engine < ::Rails::Engine
    isolate_namespace Stylin

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.autoload_paths << File.expand_path("../lib/tasks/stylin_tasks.rake", __FILE__)
  end
end
