require File.expand_path("../lib/tap_vend/version", __FILE__)

Gem::Specification.new do |s|
  s.name         = 'tap-vend'
  s.version      = TapVend::VERSION
  s.platform     = Gem::Platform::RUBY
  s.date         = '2017-06-21'
  s.summary      = 'Singer.io tap for Vend POS'
  s.description  = 'Stream Vend POS records to a Singer target, such as Stitch'
  s.authors      = ['Joe Lind']
  s.email        = 'joelind@gmail.com'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/Follain/tap-vend'


  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'
  s.executables  = ['tap-vend']
  s.add_runtime_dependency 'activesupport', '~> 5.1', '>= 5.1.1'
  s.add_runtime_dependency 'concurrent-ruby', '~> 1.0', '>= 1.0.2'
  s.add_runtime_dependency 'faraday', '~> 0.12', '>= 0.12.1'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.11', '>= 0.11.0.1'
  s.add_runtime_dependency 'glutton_ratelimit', '~> 0', '>= 0.2.0'
  s.add_runtime_dependency 'peach', '~> 0', '>= 0.5.1'
end
