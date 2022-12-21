lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autodns/version'

Gem::Specification.new do |spec|
  spec.name = 'autodns'
  spec.version = Autodns::VERSION
  spec.required_ruby_version = '>=3.1.0'
  spec.authors = ['Moritz Kraus']
  spec.email = ['moritz.kraus@makandra.de']

  spec.summary = 'CLI tools for InternetX\' autodns'
  spec.description = 'Cli tools for manipulating autoDNS resources.'
  spec.homepage = 'https://makandra.com'
  spec.license = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r(^exe/)) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'nokogiri', '~> 1'
  spec.add_runtime_dependency 'thor', '~> 1'
  spec.add_runtime_dependency 'time', '~> 0'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
