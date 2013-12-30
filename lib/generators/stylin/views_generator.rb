module Stylin
  class ViewsGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Installs Stylin views for customization."
    def views
      directory "views", "app/views"
    end
  end
end
