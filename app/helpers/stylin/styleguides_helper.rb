module Stylin
  module StyleguidesHelper
    def example_html(section)
      return @example_html if @example_html

      if File.exists? example_html_path(section.filename)
        @example_html = File.read( example_html_path(section.filename) ).html_safe
      else
        @example_html = ""
      end
    end

    def escaped_html(section)
      # to_str below causes html_safe? => false
      ERB::Util.html_escape example_html(section).to_str
    end

    private

    def example_html_base_path
      Stylin::APP_CONFIG[:html_styleguides_path]
    end

    def example_html_path(filename)
      filename = filename.split(/(.*?)\.(.*)/).reject(&:blank?).first
      File.join(example_html_base_path, "#{filename}.html")
    end
  end
end
