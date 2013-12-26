require 'spec_helper'

describe Styleguide do
  let(:styleguide) { Styleguide.new }

  describe ".sluggify" do
    it "converts a section into a slug" do
      slug = "1-1-Buttons-and-Links"
      section = "1.1 Buttons and Links"

      expect( Styleguide.sluggify(section) ).to eq(slug)
    end
  end

  describe ".desluggify" do
    it "converts a slug into a section" do
      slug = "1-1-Buttons"
      section = "1.1 Buttons"

      expect( Styleguide.desluggify(slug) ).to eq(section)
    end
  end

  describe "#find" do
    let(:section_name) { '1.1 Buttons' }

    it "returns a kss:section when a section is searched for" do
      expect( styleguide.find(section: section_name) ).to be_kind_of(Kss::Section)
    end

    it "returns the proper section" do
      expect( styleguide.find(section: section_name).section ).to eq(section_name)
    end
  end
end
