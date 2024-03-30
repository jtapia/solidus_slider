# frozen_string_literal: true

require_relative 'lib/solidus_slider/version'

Gem::Specification.new do |s|
  s.name = 'solidus_slider'
  s.version = SolidusSlider::VERSION
  s.authors = ['Giuseppe Privitera', 'Jonathan Tapia']
  s.email = 'jonathan.tapia@magmalabs.io'

  s.summary = 'Solidus Slider extension'
  s.description = 'Adds a slider to the homepage'
  s.homepage = 'https://github.com/jtapia/solidus_slider'
  s.license = 'BSD-3-Clause'

  if s.respond_to?(:metadata)
    s.metadata['homepage_uri'] = s.homepage if s.homepage
    s.metadata['source_code_uri'] = s.homepage if s.homepage
    s.metadata['rubygems_mfa_required'] = 'true'
  end

  s.required_ruby_version = Gem::Requirement.new('>= 3.0', '< 4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = 'exe'
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  solidus_version = ['>= 3', '< 5']

  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support', '~> 0.5'

  s.add_development_dependency 'solidus_backend'
  s.add_development_dependency 'solidus_frontend'
  s.add_development_dependency 'solidus_dev_support', '~> 2.5'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'growl'
end
