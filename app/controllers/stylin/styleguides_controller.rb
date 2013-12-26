require_dependency "stylin/application_controller"

module Stylin
  class StyleguidesController < ApplicationController
    def index
    end

    def show
      section_name = Styleguide.desluggify(params[:id])
      @section = styleguide.find(section: section_name)
    end
  end
end
