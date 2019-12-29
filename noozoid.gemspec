require_relative 'lib/noozoid/version'

Gem::Specification.new do |spec|
  spec.name          = 'noozoid'
  spec.version       = Noozoid::VERSION
  spec.authors       = ['Glenn Y. Rolland']
  spec.email         = ['glenux@glenux.net']

  spec.summary       = %q{A terminal-based mindmap editor for geeks.}
  spec.description   = %q{A terminal-based mindmap editor for geeks - longer text.}
  spec.homepage      = "https://glenux.net"
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_dependency 'nokogiri', '~> 1.10'
  spec.add_dependency 'curses', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.0'
end
