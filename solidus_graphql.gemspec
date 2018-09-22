
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "solidus_graphql/version"

Gem::Specification.new do |spec|
  spec.name          = "solidus_graphql"
  spec.version       = Solidus::GraphQL::VERSION
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

  spec.add_dependency 'solidus_core', [">= 2.2", "< 3"]
  spec.add_dependency "graphql", "~> 1.7"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "database_cleaner", "~> 1.7"
  spec.add_development_dependency "factory_bot", "~> 4.8"
  spec.add_development_dependency "ffaker", "~> 2.9"
  spec.add_development_dependency "pry-byebug", "~> 3.6"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec-rails", "~> 3.7"
  spec.add_development_dependency "simplecov", "~> 0.16"
  spec.add_development_dependency "sqlite3"
end
