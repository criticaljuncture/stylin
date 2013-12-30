module Stylin
  module NavigationHelper
    def styleguide_navigation
      content_for :styleguide_navigation do
        if APP_CONFIG[:section_groupings]
          custom_section_navigation
        else
          generic_section_navigation
        end
      end
    end

    def generic_section_navigation
      elements = []

      Styleguide.new.section_names.each do |section_name|
        elements << section_link(section_name)
      end

      content_tag(:ul, elements.join("\n").html_safe)
    end

    def custom_section_navigation
      elements = []

      APP_CONFIG[:section_groupings].each do |section, description|
        sections = Styleguide.new.find(section_group: section)

        section_links = sections.map do |section|
          section_link(section.section)
        end

        elements << content_tag(:li) do
          "#{section} #{description}".html_safe +
          content_tag(:ul, section_links.join("\n").html_safe)
        end
      end

      content_tag(:ul, elements.join("\n").html_safe)
    end

    private

    def section_link(section_name)
      content_tag(:li,
                  link_to(section_name, styleguide_path(Styleguide.sluggify(section_name)) )
                 )
    end
  end
end
