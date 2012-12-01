require "konfi/core_ext/kernel"

module Konfi
  autoload :Builder,     "konfi/builder"
  autoload :Config,      "konfi/config"
  autoload :ConfigItem,  "konfi/config_item"
  autoload :Version,     "konfi/version"

  def self.build(env, &block)
    @config = Builder.build(env, &block)
  end

  def self.config
    @config
  end
end
