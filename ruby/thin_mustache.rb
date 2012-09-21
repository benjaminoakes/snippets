#     ___________________/\___________________
#    /                                        \
#    |                                        |
#
# Do you only need to replace some tokens?  This is all you need (Ruby 1.9+).
module ThinMustache
  class << self
    def render(template, doc)
      template.gsub(/{{.*?}}/, curl(doc))
    end

    private

    def curl(hash)
      hash.keys.reduce({}) { |a, e|
        a["{{#{e}}}"] = hash[e]
        a
      }
    end
  end
end

require 'test/unit'

class ThinMustacheTest < Test::Unit::TestCase
  def test_render
    template = 'Hi {{name}}, This is a message for you. {{closer}}, {{me}}'
    doc = { :name => 'Danielle', :closer => 'Love always', :me => 'Ben' }

    assert_equal 'Hi Danielle, This is a message for you. Love always, Ben', ThinMustache.render(template, doc)
  end
end
