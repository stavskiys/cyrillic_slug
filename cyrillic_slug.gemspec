$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cyrillic_slug/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cyrillic_slug"
  s.version     = CyrillicSlug::VERSION
  s.authors     = ["Sergei Stavskiy"]
  s.email       = ["stavskiys@gmail.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
  s.add_dependency "the_string_to_slug"
end
