# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bistip/version"

Gem::Specification.new do |s|
  s.name        = "bistip"
  s.version     = Bistip::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Agung Prasetyo"]
  s.email       = ["brain64bit@gmail.com"]
  s.extra_rdoc_files = ["MIT-LICENSE","README"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.homepage    = "http://kav1nsky.wordpress.com"
  s.summary     = %q{A Ruby wrapper based on Bistip.com API}
  s.description = %q{Ruby wrapper that consume Bistip.com REST API, for searching trips and searching wanted post specified by some parameter}
  s.date = Time.now.utc.strftime("%A, %d% %B %Y")
  s.rubyforge_project = "bistip"
  
  s.add_dependency "httparty", "= 0.7.8"

  s.post_install_message = "Get tip for your trip"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
end
