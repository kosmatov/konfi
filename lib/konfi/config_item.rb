class Konfi::ConfigItem

  def self.build(&block)
    conf = new(&block)
    conf.attrs
  end

  def initialize(&blk)
    @attrs = {}
    instance_eval(&blk)
  end

  def method_missing(name, value = nil)
    @attrs[name] = value
  end

end