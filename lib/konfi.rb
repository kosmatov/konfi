require "konfi/core_ext/kernel"
require "active_support/core_ext/hash/deep_merge"

module Konfi
  autoload :Builder,     "konfi/builder"
  autoload :Config,      "konfi/config"
  autoload :ConfigItem,  "konfi/config_item"
  autoload :Version,     "konfi/version"

  class KonfiError < RuntimeError; end
  
  class NoValueException < KonfiError; end
  class ConfigCycleException < KonfiError; end
  class OrphanException < KonfiError; end

  def self.build(env, &block)
    @config = Builder.build(env, &block)
  end

  def self.config
    @config
  end
end
