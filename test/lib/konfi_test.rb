require 'test_helper'

class KonfiTest < MiniTest::Unit::TestCase
  def setup
    Konfi.build :dev do
      env :dev do
        key0 "value"
        key1 do
          nested_key "value"
        end
      end
    end
  end

  def test_key_value
    assert_equal "value", konfi.key0
  end

  def test_as_hash
    assert_equal "value", konfi[:key0]
  end
end
