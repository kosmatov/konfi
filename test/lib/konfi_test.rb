require 'test_helper'

class KonfiTest < MiniTest::Unit::TestCase
  def setup
    Konfi.build :dev do
      env :dev, :parent => :stage do
        key0 "value"
        key1 do
          nested_key "value1"
          nested_key1 "value2"
          nil_key nil
        end
        key_array [1,2,3]
        new "new"
        env "env"
      end

      env :test, :parent => :dev do
      end

      env :stage, parent: :prod do
      end

      env :prod do
        key2 'value2'
        key1 do
          nested_key "value3"
          prod_nested_key "prod_value"
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

  def test_nested
    assert_equal "value1", konfi.key1.nested_key
  end

  def test_nested_as_hash
    assert_equal "value1", konfi.key1[:nested_key]
  end

  def test_inheritance
    assert_equal "value2", konfi.key2
  end

  def test_raise_on_cycle_of_inheritance
    assert_raises Konfi::ConfigCycleException do
      Konfi.build :dev do
        env :dev, :parent => :prod do
          key0 "value"
        end
        env :test, :parent => :dev do
        end
        env :prod, :parent => :test do
        end
      end
    end
  end

  def test_deep_merge
    assert_equal "value1", konfi.key1.nested_key
    assert_equal "value2", konfi.key1.nested_key1
    assert_equal "prod_value", konfi.key1.prod_nested_key
  end

  def test_nils
    assert_equal nil, konfi.key1.nil_key
  end

  def test_orphan
    assert_raises Konfi::OrphanException do
      Konfi.build :dev do
        env :dev, :parent => :prod do
          key0 "value"
        end
      end
    end
  end

  def test_to_hash
    hash = { key0: "value0", key1: { nested_key: "nested value" } }
    Konfi.build :dev do
      env :dev do
        key0 "value0"
        key1 do
          nested_key "nested value"
        end
      end
    end

    assert_equal hash, konfi.to_hash
    assert_equal hash[:key1], konfi.key1.to_hash
  end

  def test_when_no_value
    assert_raises Konfi::NoValueException do
      Konfi.build :dev do
        env :dev do
          key0
        end
      end
    end
  end

  def test_array
    assert_equal [1,2,3], konfi.key_array
  end
end
