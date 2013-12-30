require 'jquery-rails'
require 'sass-rails'
require 'bootstrap-sass'
require 'kss'
require "stylin/engine"

module Stylin
  config = {
    stylesheets_path: File.join('app', 'assets', 'stylesheets'),
    html_styleguides_path: File.join('app', 'styleguides'),
    section_groupings: nil
  }

  if File.exists?( File.join('config', 'stylin.yml') )
    user_config = HashWithIndifferentAccess.new(
      YAML.load(
        File.read( File.expand_path(File.join('config', 'stylin.yml'), Rails.root) )
      )
    ).symbolize_keys
  else
    user_config = {}
  end

  APP_CONFIG = config.merge( user_config )

  APP_CONFIG[:stylesheets_path] = File.expand_path(APP_CONFIG[:stylesheets_path], Rails.root)
  APP_CONFIG[:html_styleguides_path] = File.expand_path(APP_CONFIG[:html_styleguides_path], Rails.root)
end
