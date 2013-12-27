class Styleguide
  attr_reader :section_names, :styleguide

  def initialize
    @styleguide ||= Kss::Parser.new( File.expand_path(Stylin::STYLESHEETS_PATH, Rails.root) )
    @section_names ||= styleguide.sections.map{|s| s[1].section}.sort
  end


  def find(conditions)
    section = conditions.delete(:section)
    section_group = conditions.delete(:section_group)

    if section_group.present?
      find_grouped_sections(section_group)
    elsif section.present?
      find_by_section(section)
    end
  end

  def build_section_hierarchy

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

  def find_grouped_sections(section_group)
    grouped_sections.select{|k,v| k.to_i == section_group}.values.flatten.map do |section_name|
      find_by_section(section_name)
    end
  end

  def grouped_sections
    @grouped_sections ||= section_names.group_by do |x|
      x.split('.')[0]
    end
  end

  def self.is_integer?(string)
    /\A[-+]?[0-9]+\Z/ === string
  end
end
