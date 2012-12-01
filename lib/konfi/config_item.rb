class Konfi::ConfigItem
  attr_reader :attrs

  def self.build(&block)
    conf = new(&block)
    conf.attrs
  end

  def initialize(&blk)
    @attrs = {}
    instance_eval(&blk)
  end

  def method_missing(name, *args, &block)
    if block_given?
      @attrs[name] = self.class.build(&block)
    else
      raise Konfi::NoValueException.new if args.length == 0
      @attrs[name] = args[0]
    end
  end

end
