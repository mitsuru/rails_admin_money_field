$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_money_field/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_money_field"
  s.version     = RailsAdminMoneyField::VERSION
  s.authors     = ["mitz"]
  s.email       = ["hayasaka.mitsuru@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsAdminMoneyField."
  s.description = "TODO: Description of RailsAdminMoneyField."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5.1"
end
