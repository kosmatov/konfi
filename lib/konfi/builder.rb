class ConfigCycleException < StandardError; end

class Konfi::Builder
  attr_reader :config

  def self.build(env, &block)
    builder = new(env, &block)
    builder.config
  end

  def initialize(env, &block)
    @envs = {}
    @ancestry = {}
    instance_eval(&block)

    puts "anc =====#{@ancestry}"

    santa_barbara(env)

    @config = Konfi::Config.new @envs[env]
  end

  def env(name, options = nil, &block)
    ci = Konfi::ConfigItem.build(&block)
    @envs[name] = ci
    @ancestry[name] = options[:parent] if options
  end

  def santa_barbara(env)
    check_cycle(env)

    if parent = @ancestry[env]
      @envs[env] = @envs[parent].deep_merge @envs[env]
    end
  end

  def check_cycle(env)
    tmp_env = env
    found_envs = [tmp_env]
    while @ancestry[tmp_env]
      tmp_env =  @ancestry[tmp_env]
      raise ConfigCycleException.new if found_envs.include? tmp_env
      found_envs << tmp_env
    end

  end
end
