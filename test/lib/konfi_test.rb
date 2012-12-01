require 'test_helper'

class KonfiTest < MiniTest::Unit::TestCase
  def setup
    Konfi.build do
      key "value"
    end
  end

  def test_key_value
    assert_equal konfi.key, "value"
  end
end
