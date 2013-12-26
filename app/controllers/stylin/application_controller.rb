module Stylin
  class ApplicationController < ActionController::Base

    private

    helper_method :styleguide
    def styleguide
      @styleguide ||= Styleguide.new
    end
  end
end
