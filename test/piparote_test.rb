require 'test_helper'
require 'uri'
require 'open-uri'
require 'nokogiri'
require 'piparote'

include Piparote
include Nokogiri

class PiparoteTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Piparote::VERSION
  end

  def test_object
    assert_kind_of ::Piparote::Object, 'http://eustaquiorangel.com'.URI
  end

  def test_object_method
    assert_kind_of ::URI::HTTP, 'http://eustaquiorangel.com'.URI.parse
  end

  def test_existing_methods
    assert_kind_of String, 'http://eustaquiorangel.com'.URI.parse.open.read
  end

  def test_nokogiri
    assert_kind_of Nokogiri::HTML::Document, 'http://eustaquiorangel.com'.URI.parse.open.read.HTML.parse
  end

  def test_nokogiri_css
    assert_kind_of Nokogiri::XML::NodeSet, 'http://eustaquiorangel.com'.URI.parse.open.read.HTML.parse.css('h2')
  end

  def test_block
    assert_kind_of Array, 'http://eustaquiorangel.com'.URI.parse.open.read.HTML.parse.css('h2').map { |h2| h2.text }
  end

  def test_other_existing_methods
    assert_kind_of String, 'http://eustaquiorangel.com'.URI.parse.open.read.HTML.parse.css('h2').map { |h2| h2.text }.join(' - ')
  end
end
