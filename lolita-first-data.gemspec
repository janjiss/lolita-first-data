# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "lolita-first-data"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ITHouse, Gatis Tomsons"]
  s.date = "2012-07-30"
  s.description = "FirstData Payment plugin for Lolita using ActiveMerchant"
  s.email = "gatis@ithouse.cc"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/controllers/lolita/first_data/common_controller.rb",
    "app/controllers/lolita/first_data/test_controller.rb",
    "app/controllers/lolita/first_data/transaction_controller.rb",
    "app/models/lolita/first_data/transaction.rb",
    "config/locales/en.yml",
    "config/locales/lv.yml",
    "config/routes.rb",
    "lib/generators/lolita_first_data/install_generator.rb",
    "lib/generators/lolita_first_data/templates/migration.rb",
    "lib/lolita-first-data.rb",
    "lib/lolita-first-data/billing.rb",
    "lib/lolita-first-data/custom_logger.rb",
    "lib/lolita-first-data/gateway.rb",
    "lib/lolita-first-data/rails.rb",
    "lib/tasks/first_data_tasks.rake",
    "lolita-first-data.gemspec",
    "spec/cert.pem",
    "spec/fabricators/reservation_fabricator.rb",
    "spec/fabricators/transaction_fabricator.rb",
    "spec/first_data_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/rails.rb"
  ]
  s.homepage = "http://github.com/ithouse/lolita-first-data"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.17"
  s.summary = "FirstData Payment plugin for Lolita"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activemerchant>, [">= 1.26"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.4"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.7.6"])
      s.add_development_dependency(%q<debugger>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<fabrication>, ["~> 1.1.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<activemerchant>, [">= 1.26"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.4"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<webmock>, ["~> 1.7.6"])
      s.add_dependency(%q<debugger>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<fabrication>, ["~> 1.1.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<activemerchant>, [">= 1.26"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.4"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<webmock>, ["~> 1.7.6"])
    s.add_dependency(%q<debugger>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<fabrication>, ["~> 1.1.0"])
  end
end

