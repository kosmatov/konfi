class Konfi::Config

  def initialize(hash)
    hash.each do |k, v|
      define_singleton_method(k) do
        v
      end
    end
  end

  def [](key)
    send key
  end

end
