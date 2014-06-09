# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamweek/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'teamweek-ruby'
  spec.version       = Teamweek::Api::VERSION
  spec.authors       = ['Toggl OÜ']
  spec.email         = ['support@teamweek.com']
  spec.summary       = %q{Ruby gem to communicate with Teamweek API.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = ['lib/teamweek-ruby.rb']
  spec.files        += Dir.glob('lib/teamweek/api/*.rb')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty'

  spec.add_development_dependency 'bundler', "~> 1.6"
  spec.add_development_dependency 'rake'
end
