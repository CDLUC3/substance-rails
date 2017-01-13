$:.push File.expand_path("../lib", __FILE__)
require "substance/rails/version"

Gem::Specification.new do |s|
  s.name        = "substance-rails"
  s.version     = Substance::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Riley"]
  s.email       = ["riley.bri@gmail.com"]
  s.license     = 'MIT'
  s.homepage    = "https://github.com/briri/substance-rails"
  s.summary     = %q{Substance Editor for Rails 4, 3.x Asset Pipeline}
  s.description = %q{substance-rails project integrates the Substance Editor for Rails 4, 3.x Asset Pipeline}

  s.rubyforge_project = "substance-rails"
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + Dir["app/**/*"] + ["Rakefile", "README.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency         'railties',         '~> 3.1'
  s.add_dependency         'actionpack',       '~> 3.1'

  s.add_development_dependency 'rails',        '~> 4.1'

  s.add_development_dependency 'therubyracer', '~> 0.12'
end