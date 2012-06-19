$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_captcha/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_captcha"
  s.version     = RailsCaptcha::VERSION
  s.authors     = ["Andrey"]
  s.email       = ["railscode@gmail.com"]
  s.homepage    = "https://github.com/vav/rails_captcha"
  s.summary     = "Rails Captcha Engine for Rails 3 applications"
  s.description = "It's a Rails Captcha Engine for Rails 3 applications."
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.add_dependency "rails", ">= 3.2.0"
  s.add_dependency "rmagick", ">= 2.13.1"
end
