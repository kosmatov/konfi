require "konfi/version"
require "konfi/core_ext/kernel"
require "konfi/config"
require "konfi/builder"

module Konfi
  def self.build(env, &block)
    Builder.build(env, &block)
  end
end
