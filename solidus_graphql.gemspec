
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "solidus_graphql/version"

Gem::Specification.new do |spec|
  spec.name          = "solidus_graphql"
  spec.version       = Solidus::Graphql::VERSION
  spec.authors       = ["Minh Ha"]
  spec.email         = ["minh@valiants.co"]

  spec.summary       = %q{graphql support for solidus.}
  spec.description   = %q{graphql support for solidus.}
  spec.homepage      = "https://github.com/valiants/solidus_graphql"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'solidus_api', spec.version
  spec.add_dependency 'solidus_core', spec.version

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
