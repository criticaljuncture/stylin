module Stylin
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Installs Stylin ready for use."
    def install
      copy_file "stylin.yml", "config/stylin.yml"
      empty_directory "app/styleguides"
      route "mount Stylin::Engine => '/styleguides' if Rails.env.development?"
    end
  end
end
