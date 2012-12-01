class Konfi::Builder
  attr_reader :config

  def self.build(env, &block)
    builder = new(env, &block)
    builder.config
  end

  def initialize(env, &block)
    @envs = {}
    instance_eval(&block)

    @config = Konfi::Config.new @envs[env]
  end

  def env(name, &block)
    @envs[name] = nil #TODO переписать
    ci = Konfi::ConfigItem.build(&block)
    @envs[name] = ci
  end

end
