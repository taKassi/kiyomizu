# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kiyomizu/version'

Gem::Specification.new do |spec|
  spec.name          = "kiyomizu"
  spec.version       = Kiyomizu::VERSION
  spec.authors       = ["taKassi"]
  spec.email         = ["leowl0279@gmail.com"]
  spec.summary       = %q{My original crawler}
  spec.description   = %q{My original crawler}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'nokogiri', '~> 1.6'
  spec.add_runtime_dependency 'capybara'
  spec.add_runtime_dependency 'anemone', '~> 0.7'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
