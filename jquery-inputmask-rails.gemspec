$:.push File.expand_path("../lib", __FILE__)
require "jquery-inputmask-rails/version"

Gem::Specification.new do |s|
  s.name        = "jquery-inputmask-rails"
  s.version     = JqueryInputmaskRails::VERSION
  s.authors     = ["Krzysztof Knapik"]
  s.email       = ["knapo@knapo.net"]
  s.license      = 'MIT'
  s.homepage    = "https://github.com/knapo/jquery-inputmask-rails"
  s.summary     = %q{jquery.inputmask integration for Rails 3.1+ asset pipeline}
  s.description = %q{jquery.inputmask [https://github.com/RobinHerbots/jquery.inputmask] integration for Rails 3.1+ asset pipeline}

  s.rubyforge_project = "jquery-inputmask-rails"
  s.files = Dir["{vendor,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]
  s.require_paths = ["lib"]

  s.add_dependency 'railties',   '>= 3.1'
end
