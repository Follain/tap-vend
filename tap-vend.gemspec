require File.expand_path("../lib/tap_vend/version", __FILE__)

Gem::Specification.new do |s|
  s.name         = 'tap-vend'
  s.version      = TapVend::VERSION
  s.platform     = Gem::Platform::RUBY
  s.date         = '2017-06-21'
  s.summary      = 'Singer.io tap for Vend POS'
  s.description  = 'Stream Vend POS records to a Singer target, such as Stitch'
  s.authors      = ['Joe Lind']
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'
  s.executables  = ['tap-vend']
  s.add_dependency 'activesupport'
  s.add_dependency 'concurrent-ruby'
  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'glutton_ratelimit'
  s.add_dependency 'peach'
end
