# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opal/actioncable/version'

Gem::Specification.new do |spec|
  spec.name          = "opal-actioncable"
  spec.version       = Opal::Actioncable::VERSION
  spec.authors       = ["Jose Añasco", "Michael Sprauer"]
  spec.email         = ["joseanasco1@gmail.com", "Michael@Sprauer.net"]

  spec.summary       = %q{ActionCable adapter for Opal}
  spec.description   = %q{Bring all the ActionCable goodness back to the ruby language}
  spec.homepage      = "https://github.com/MichaelSp/opal-actioncable"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
