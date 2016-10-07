$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "media_embed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "media_embed"
  s.version     = MediaEmbed::VERSION
  s.authors     = ["WendyBeth"]
  s.email       = ["wendybeth010@gmail.com"]
  s.homepage    = ""
  s.summary     = "Easy media embedding"
  s.description = "Embed media such as videos and podcasts into your Rails view files with ease"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "rake"
end
