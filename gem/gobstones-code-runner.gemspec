lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gobstones/code-runner/version"

Gem::Specification.new do |spec|
  spec.authors       = ["Rodrigo Alfonso"]
  spec.email         = ["info@gobstones.org"]

  spec.summary       = "Gobstones Code Runner"
  spec.homepage      = "https://github.com/gobstones/gobstones-code-runner"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + Dir["app/**/*"] + ["Rakefile", "README.md"]
  spec.test_files    = `git ls-files -- {test,spec}/*`.split("\n")

  spec.name          = "gobstones-code-runner"
  spec.require_paths = ["lib"]
  spec.version       = Gobstones::CodeRunner::VERSION

  spec.add_development_dependency "bundler", ">= 1.16", "< 3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.required_ruby_version = '>= 2.3'
end
