# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beer_advocate/version'

Gem::Specification.new do |spec|
  spec.name          = "beer_advocate"
  spec.version       = BeerAdvocate::VERSION
  spec.authors       = ["Anuj Panchal"]
  spec.email         = ["anujpan1@gmail.com"]

  spec.summary       = "Light weight cli that pulls in a list of beer advocates top 250 and allows you to pull info on each one"
  spec.homepage      = "https://github.com/anujpan/beer-advocate-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
