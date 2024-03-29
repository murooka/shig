# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shig/version'

Gem::Specification.new do |spec|
  spec.name          = "shig"
  spec.version       = Shig::VERSION
  spec.authors       = ["Naoki Yaguchi"]
  spec.email         = ["murooka.1129.x50@gmail.com"]

  spec.summary       = %q{lightweight Web Application Framework}
  spec.description   = %q{lightweight Web Application Framework inspired by Amon2}
  spec.homepage      = "https://github.com/murooka/shig"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
