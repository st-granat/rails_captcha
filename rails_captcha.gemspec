$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_captcha/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_captcha"
  s.version     = RailsCaptcha::VERSION
  s.authors     = ["Andrey"]
  s.email       = ["railscode@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsCaptcha."
  s.description = "It's a Rails Captcha Engine for Rails 3.2 applications."
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.add_dependency "rails", ">= 3.2.5"
  s.add_dependency "rmagick", ">= 2.13.1"
end