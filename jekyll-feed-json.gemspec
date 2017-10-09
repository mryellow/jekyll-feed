# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-feed-json"
  spec.version       = "0.0.3"
  spec.authors       = ["Mr-Yellow"]
  spec.email         = ["mr-yellow@mr-yellow.com"]
  spec.summary       = "A Jekyll plugin to generate a JSON feed of your Jekyll posts"
  spec.homepage      = "https://github.com/mryellow/jekyll-feed-json"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r!^bin/!) { |f| File.basename(f) }
  #spec.test_files    = spec.files.grep(%r!^(test|spec|features)/!)
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 3.3"

  #spec.add_development_dependency "bundler", "~> 1.6"
  #spec.add_development_dependency "rake", "~> 10.0"
  #spec.add_development_dependency "rspec", "~> 3.0"
  #spec.add_development_dependency "typhoeus", "~> 0.7"
  #spec.add_development_dependency "nokogiri", "~> 1.6"
  #spec.add_development_dependency "rubocop"
end
