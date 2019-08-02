
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rack/version"

Gem::Specification.new do |spec|
  spec.name          = "rack"
  spec.version       = Rack::VERSION
  spec.authors       = ["shoopapa"]
  spec.email         = ["joedavis29@gmail.com"]

  spec.summary       = %q{ort summary, because RubyGems requires one.}
  spec.description   = %q{e a longer description or delete this line.}
  spec.homepage      = "http://google.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exec_files"
  require 'awesome_print'
  ap spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
