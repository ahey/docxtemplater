# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docxtemplater/version'

Gem::Specification.new do |spec|
  spec.name          = "docxtemplater"
  spec.version       = Docxtemplater::VERSION
  spec.authors       = ["Alan Heywood"]
  spec.email         = ["alan@softweb.net.au"]

  spec.summary       = %q{A thin wrapper over the nodejs docxtemplater}
  spec.description   = %q{A ruby interface to the nodejs, command line https://github.com/open-xml-templating/docxtemplater}
  spec.homepage      = "https://github.com/ahey/docxtemplater"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-stack_explorer"
end
