module NavigationHelper
  def styleguide_navigation(sections)
    elements = []
    sections.each do |section|
      elements << content_tag(:li, section)
    end

    content_for :styleguide_navigation do
      content_tag(:ul, elements.join("\n").html_safe)
    end
  end
end
