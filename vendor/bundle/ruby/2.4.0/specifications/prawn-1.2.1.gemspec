# -*- encoding: utf-8 -*-
# stub: prawn 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "prawn".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gregory Brown".freeze, "Brad Ediger".freeze, "Daniel Nelson".freeze, "Jonathan Greenberg".freeze, "James Healy".freeze]
  s.date = "2014-07-27"
  s.description = "  Prawn is a fast, tiny, and nimble PDF generator for Ruby\n".freeze
  s.email = ["gregory.t.brown@gmail.com".freeze, "brad@bradediger.com".freeze, "dnelson@bluejade.com".freeze, "greenberg@entryway.net".freeze, "jimmy@deefa.com".freeze]
  s.homepage = "http://prawn.majesticseacreature.com".freeze
  s.licenses = ["RUBY".freeze, "GPL-2".freeze, "GPL-3".freeze]
  s.post_install_message = "\n  ********************************************\n\n\n  A lot has changed recently in Prawn.\n\n  Please read the changelog for details:\n\n  https://github.com/prawnpdf/prawn/wiki/CHANGELOG\n\n\n  ********************************************\n\n".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubyforge_project = "prawn".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "A fast and nimble PDF generator for Ruby".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ttfunk>.freeze, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<pdf-core>.freeze, ["~> 0.2.5"])
      s.add_development_dependency(%q<pdf-inspector>.freeze, ["~> 1.1.0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["= 2.14.1"])
      s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<prawn-manual_builder>.freeze, [">= 0.2.0"])
      s.add_development_dependency(%q<pdf-reader>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.20.1"])
    else
      s.add_dependency(%q<ttfunk>.freeze, ["~> 1.2.0"])
      s.add_dependency(%q<pdf-core>.freeze, ["~> 0.2.5"])
      s.add_dependency(%q<pdf-inspector>.freeze, ["~> 1.1.0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["= 2.14.1"])
      s.add_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<prawn-manual_builder>.freeze, [">= 0.2.0"])
      s.add_dependency(%q<pdf-reader>.freeze, ["~> 1.2"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.20.1"])
    end
  else
    s.add_dependency(%q<ttfunk>.freeze, ["~> 1.2.0"])
    s.add_dependency(%q<pdf-core>.freeze, ["~> 0.2.5"])
    s.add_dependency(%q<pdf-inspector>.freeze, ["~> 1.1.0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["= 2.14.1"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<prawn-manual_builder>.freeze, [">= 0.2.0"])
    s.add_dependency(%q<pdf-reader>.freeze, ["~> 1.2"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.20.1"])
  end
end
