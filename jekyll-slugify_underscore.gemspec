# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/slugify_underscore/version'

Gem::Specification.new do |spec|
  spec.name        = "jekyll-slugify_underscore"
  spec.version     = Jekyll::SlugifyUnderscore::VERSION
  spec.summary     = "Jekyll slugify with underscores."
  spec.description = "A plugin to make Jekyll slugify with underscores instead of hyphens."
  spec.authors     = ["Paul Robert Lloyd"]
  spec.email       = "me+rubygems@paulrobertlloyd.com"
  spec.files       = Dir.glob("lib/**/*.rb")
  spec.homepage    = "https://github.com/paulrobertlloyd/jekyll-slugify_underscore"
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

# spec.add_development_dependency "jekyll", [">= 3.0.2", "< 4.0"] # will be this
  spec.add_development_dependency "jekyll", [">= 3.0.1", "< 4.0"] # temp fix
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rake', '~> 13'
  spec.add_development_dependency "bundler", "~> 1.6"
end
