class Konfi::Builder
  attr_reader :config

  def self.build(env, &block)
    builder = new(env, &block)
    builder.config
  end

  def initialize(env, &block)
    @config = nil
  end

end
