# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cidr_regex/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alex Tomlins"]
  gem.email         = ["alex@tomlins.org.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "cidr_regex"
  gem.require_paths = ["lib"]
  gem.version       = CIDRRegex::VERSION

  gem.add_dependency "netaddr", "~> 1.5.0"
  gem.add_development_dependency "rspec", "~> 2.8.0"
end
