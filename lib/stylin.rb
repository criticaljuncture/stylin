require 'jquery-rails'
require 'sass-rails'
require 'bootstrap-sass'
require 'kss'
require "stylin/engine"

module Stylin
  STYLESHEETS_PATH = File.join('app', 'assets', 'stylesheets')
  HTML_STYLEGUIDES_PATH = File.join('app', 'styleguides')
end
