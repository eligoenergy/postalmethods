Gem::Specification.new do |s|
  s.name = %q{postalmethods}
  s.version = "1.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Cox", "Joe Fair"]
  s.date = %q{2010-07-01}
  s.description = %q{API wrapper library for the postal methods api.}
  s.email = ["joe@bodkinconsulting.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/postalmethods.rb", "lib/postalmethods/document_processor.rb", "lib/postalmethods/exceptions.rb", "lib/postalmethods/get_letter_status.rb", "lib/postalmethods/send_letter.rb", "lib/postalmethods/utility.rb", "postalmethods.gemspec", "script/console", "script/destroy", "script/generate", "setup.rb", "spec/doc/WSDL-Output", "spec/doc/default.rb", "spec/doc/defaultMappingRegistry.rb", "spec/doc/sample.pdf", "spec/document_processor_spec.rb", "spec/get_letter_status_spec.rb", "spec/postalmethods_spec.rb", "spec/rcov.opts", "spec/send_letter_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/utility_spec.rb", "tasks/rspec.rake", "spec/doc/postcard_address_side_with_return_address.html", "spec/doc/postcard_image_side_with_return_address.html"]
  s.has_rdoc = true
  s.homepage = 'http://www.postalmethods.com/resources/quickstart'
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{postalmethods}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{API wrapper library for the postal methods api.}
  s.add_dependency(%q<soap2r>)
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<newgem>, [">= 1.2.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
