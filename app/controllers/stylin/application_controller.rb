module Stylin
  class ApplicationController < ActionController::Base

    private

    helper_method :styleguide
    def styleguide
      @styleguide ||= Kss::Parser.new( File.expand_path(Stylin::STYLESHEETS_PATH, Rails.root) )
    end
  end
end
