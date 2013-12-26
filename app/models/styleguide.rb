class Styleguide
  attr_reader :sections, :styleguide

  def initialize
    @styleguide ||= Kss::Parser.new( File.expand_path(Stylin::STYLESHEETS_PATH, Rails.root) )
    @sections ||= styleguide.sections.map{|s| s[1].section}.sort
  end


  def find(conditions)
    section = conditions.delete(:section)

    find_by_section(section) if section
  end

  def self.sluggify(section)
    numbers = section.split(' ')[0].split('.')
    strings = section.split(' ')[1..-1]

    "#{numbers.join('-')}-#{strings.join('-')}"
  end

  def self.desluggify(slug)
    slug_parts = slug.split('-')
    numbers = []
    strings = []

    slug_parts.each do |slug_part|
      if is_integer?(slug_part)
        numbers << slug_part
      else
        strings << slug_part
      end
    end

    "#{numbers.join('.')} #{strings.join(' ')}"
  end

  private

  def find_by_section(section)
    styleguide.section(section)
  end

  def self.is_integer?(string)
    /\A[-+]?[0-9]+\Z/ === string
  end
end
