require_dependency "stylin/application_controller"

module Stylin
  class StyleguidesController < ApplicationController
    def index
      @sections = styleguide.sections.map{|s| s[1].section}
    end
  end
end
