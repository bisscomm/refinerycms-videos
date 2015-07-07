# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-videos'
  s.version           = '3.0.0'
  s.description       = 'Ruby on Rails Videos extension for Refinery CMS'
  s.date              = '2014-10-22'
  s.summary           = 'Videos extension for Refinery CMS'
  s.email             = %q{support@bisscomm.com}
  s.homepage          = %q{http://www.bisscomm.com}
  s.authors           = ['Brice Sanchez']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',            '~> 3.0.0'
  s.add_dependency    'globalize',                   ['>= 4.0.0', '< 5.2']

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.0'
end
