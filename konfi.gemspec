# -*- encoding: utf-8 -*-
require File.expand_path('../lib/konfi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Konstantin Kosmatov"]
  gem.email         = ["key@kosmatov.su"]
  gem.description   = %q{global configuration}
  gem.summary       = %q{use global configuration in u app}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "konfi"
  gem.require_paths = ["lib"]
  gem.version       = Konfi::VERSION
end
