require 'rubygems/package_task'
require 'rubygems/specification'
require 'bundler'

GEM         = "snuggie"
GEM_VERSION = "0.3.0"
AUTHOR      = "Corey Donohoe"
EMAIL       = "atmos@atmos.org"
HOMEPAGE    = "http://github.com/atmos/snuggie"
SUMMARY     = "The development environment you never wanted to manage alone"

spec = Gem::Specification.new do |s|
  s.name             = GEM
  s.version          = GEM_VERSION
  s.platform         = Gem::Platform::RUBY
  s.has_rdoc         = true
  s.extra_rdoc_files = ["LICENSE"]
  s.summary          = SUMMARY
  s.description      = s.summary
  s.author           = AUTHOR
  s.email            = EMAIL
  s.homepage         = HOMEPAGE

  s.add_dependency "lunchy",      "~>0.5.0"
  s.add_dependency "chef",        "=0.10.4"
  s.add_dependency "json",        "=1.5.2"
  s.add_dependency "rest-client", "~>1.6.1"

  s.bindir       = "bin"
  s.executables  = %w( snuggie )
  s.require_path = 'lib'
  s.files        = %w(LICENSE README.md Rakefile) + Dir.glob("{lib}/**/*")
end

Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
