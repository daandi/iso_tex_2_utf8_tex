# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso_tex_2_utf8_tex/version'

Gem::Specification.new do |spec|
  spec.name          = "iso_tex_2_utf8_tex"
  spec.version       = IsoTex2Utf8Tex::VERSION
  spec.authors       = ["Andreas Neumann"]
  spec.email         = ["andreas@neumann.biz"]
  spec.summary       = %q{This gem provides a command line tool to transform german latex files written in ISO-85589-1 to their equivalent utf-8 version}
  spec.description   = %q{This gem provides a command line tool to transform german latex files written in ISO-85589-1 to their equivalent utf-8 version}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
