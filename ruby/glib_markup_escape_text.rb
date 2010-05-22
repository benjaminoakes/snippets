# Implementation of escaping for Pango Markup, based on the rules found at:  http://ruby-gnome2.sourceforge.jp/hiki.cgi?Gtk%3A%3ALabel
# 
# NOTE I submitted a patch, but I think there's something in `CGI` that's supposed to be used instead.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'test/unit'

module GLib
  module Markup
    MARKUP_ESCAPE_SEQUENCES = {
      '<' => '&lt;',
      '>' => '&gt;',
      '&' => '&amp;'
    }
    
    # Escape characters that aren't legal in Pango markup, as listed in GLib::Markup::MARKUP_ESCAPE_SEQUENCES.
    #--
    # Perhaps it would make sense to make this work such that it always gets called when setting markup?
    def self.escape_text(markup_string)
      escaped = markup_string.dup
    
      MARKUP_ESCAPE_SEQUENCES.each do |original, replacement|
        escaped.gsub!(original, replacement)
      end
    
      return escaped
    end
  end
end

module Glib
  class MarkupTest < Test::Unit::TestCase
    def test_replacement_of_lt_and_gt_in_class_inspection
      assert_equal('#&lt;SomeClassName:0x9999999 @instancevar=#&lt;AnotherClassName:0x9999999&gt;&gt;', GLib::Markup.escape_text('#<SomeClassName:0x9999999 @instancevar=#<AnotherClassName:0x9999999>>'))
    end

    def test_replacement_of_amp
      assert_equal("Ben &amp; Jerry's", GLib::Markup.escape_text("Ben & Jerry's"))
    end

    def test_replacement_of_lt_gt_and_amp
      # Not really a realistic string, but it does the job
      assert_equal('&lt;&amp;&gt;', GLib::Markup.escape_text('<&>'))
    end
  end
end


