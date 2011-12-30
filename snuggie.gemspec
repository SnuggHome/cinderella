# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "snuggie/version"

Gem::Specification.new do |s|
  s.name        = "snuggie"
  s.version     = Snuggie::VERSION
  s.authors     = ["Corey Donohoe"]
  s.email       = ["atmos@atmos.org"]
  s.homepage    = "https://github.com/atmos/snuggie"
  s.summary     = %q{The development environment you never wanted to manage alone}
  s.description = %q{The development environment you never wanted to manage alone}

  s.rubyforge_project = "snuggie"

  s.add_dependency "lunchy",      "~>0.5.0"
  s.add_dependency "chef",        "=0.10.4"
  s.add_dependency "json",        "=1.5.2"
  s.add_dependency "rest-client", "~>1.6.1"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
