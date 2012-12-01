require 'test_helper'

class KonfiTest < MiniTest::Unit::TestCase
  def setup
    Konfi.build :dev do
      key "value"
    end
  end

  def test_key_value
    assert_equal "value", konfi.key
  end
end
