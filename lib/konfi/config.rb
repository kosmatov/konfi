class Konfi::Config

  def self.build(hash)
    hash.each do |k,v|
      define_singleton_method(k) do |arg|
        return v
      end
    end
  end

end
