require 'test_helper'

class KonfiTest < MiniTest::Unit::TestCase
  def setup
    Konfi.build :dev do
      env :dev do
        key0 "value"
        key1 do
          nested_key "value1"
        end
        new "new"
        #define_singleton_method "fkdsj"
        env "env"
      end
    end
  end

  def test_key_value
    assert_equal "value", konfi.key0
  end

  def test_as_hash
    assert_equal "value", konfi[:key0]
  end

  def test_nested
    assert_equal "value1", konfi.key1.nested_key
  end

  def test_nested_as_hash
    assert_equal "value1", konfi.key1[:nested_key]
  end
end
