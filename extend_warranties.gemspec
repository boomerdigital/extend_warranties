
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "extend_warranties/version"

Gem::Specification.new do |spec|
  spec.name          = "extend_warranties"
  spec.version       = ExtendWarranties::VERSION
  spec.authors       = ["Allison Reilly", "Daniel J. Pritchett"]
  spec.email         = ["acreilly3@gmail.com", "dpritchett@gmail.com"]

  spec.summary       = %q{Ruby client for Extend API}
  spec.description   = %q{Ruby client for Extend API}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"

  spec.add_development_dependency "bundler", ">= 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
