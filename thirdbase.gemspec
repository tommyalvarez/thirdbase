# -*- encoding: utf-8 -*-
# stub: thirdbase 2.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "thirdbase".freeze
  s.version = "2.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Karle Durante".freeze, "Hunter Madison".freeze, "Ken Collins".freeze]
  s.date = "2019-01-14"
  s.description = "ThirdBase provides support for Rails to manage dual databases by extending ActiveRecord tasks that create, migrate, and test your databases.".freeze
  s.email = ["kdurante@customink.com".freeze, "hunterglenmadison@icloud.com".freeze, "ken@metaskills.net".freeze]
  s.files = [".gitignore".freeze, ".travis.yml".freeze, ".yardopts".freeze, "Appraisals".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "VERSION".freeze, "thirdbase.gemspec".freeze, "gemfiles/rails40.gemfile".freeze, "gemfiles/rails41.gemfile".freeze, "gemfiles/rails42.gemfile".freeze, "gemfiles/rails50.gemfile".freeze, "gemfiles/rails51.gemfile".freeze, "lib/third_base.rb".freeze, "lib/third_base/base.rb".freeze, "lib/third_base/databases.rake".freeze, "lib/third_base/databases_rails_five.rake".freeze, "lib/third_base/databases_rails_four.rake".freeze, "lib/third_base/forced.rb".freeze, "lib/third_base/on_base.rb".freeze, "lib/third_base/railtie.rb".freeze, "lib/third_base/test_help.rb".freeze, "lib/third_base/version.rb".freeze, "lib/thirdbase.rb".freeze, "lib/rails/third_base/generators/migration_generator.rb".freeze, "test/cases/dbtask_test.rb".freeze, "test/cases/forced_test.rb".freeze, "test/cases/generator_test.rb".freeze, "test/cases/on_base_test.rb".freeze, "test/cases/railtie_test.rb".freeze, "test/cases/rake_test.rb".freeze, "test/dummy_apps/rails_five/Rakefile".freeze, "test/dummy_apps/rails_five/app/controllers/application_controller.rb".freeze, "test/dummy_apps/rails_five/app/helpers/application_helper.rb".freeze, "test/dummy_apps/rails_five/app/models/application_record.rb".freeze, "test/dummy_apps/rails_five/app/models/comment.rb".freeze, "test/dummy_apps/rails_five/app/models/comment_forced.rb".freeze, "test/dummy_apps/rails_five/app/models/post.rb".freeze, "test/dummy_apps/rails_five/app/models/user.rb".freeze, "test/dummy_apps/rails_five/bin/rails".freeze, "test/dummy_apps/rails_five/config/database.yml".freeze, "test/dummy_apps/rails_five/config/init.rb".freeze, "test/dummy_apps/rails_five/config/routes.rb".freeze, "test/dummy_apps/rails_five/db/migrate/20141209165002_create_users.rb".freeze, "test/dummy_apps/rails_five/db/migrate/20141214142700_create_posts.rb".freeze, "test/dummy_apps/rails_five/db/thirdbase/migrate/20151202075826_create_comments.rb".freeze, "test/dummy_apps/rails_five/log/.keep".freeze, "test/dummy_apps/rails_five/tmp/.keep".freeze, "test/dummy_apps/rails_four/Rakefile".freeze, "test/dummy_apps/rails_four/app/controllers/application_controller.rb".freeze, "test/dummy_apps/rails_four/app/helpers/application_helper.rb".freeze, "test/dummy_apps/rails_four/app/models/comment.rb".freeze, "test/dummy_apps/rails_four/app/models/comment_forced.rb".freeze, "test/dummy_apps/rails_four/app/models/post.rb".freeze, "test/dummy_apps/rails_four/app/models/user.rb".freeze, "test/dummy_apps/rails_four/bin/rails".freeze, "test/dummy_apps/rails_four/config/database.yml".freeze, "test/dummy_apps/rails_four/config/routes.rb".freeze, "test/dummy_apps/rails_four/db/migrate/20141209165002_create_users.rb".freeze, "test/dummy_apps/rails_four/db/migrate/20141214142700_create_posts.rb".freeze, "test/dummy_apps/rails_four/db/thirdbase/migrate/20151202075826_create_comments.rb".freeze, "test/dummy_apps/rails_four/init.rb".freeze, "test/dummy_apps/rails_four/log/.keep".freeze, "test/dummy_apps/rails_four/tmp/.keep".freeze, "test/test_helper.rb".freeze, "test/test_helpers/dummy_app_helpers.rb".freeze, "test/test_helpers/rails_version_helpers.rb".freeze, "test/test_helpers/stream_helpers.rb".freeze]
  s.homepage = "http://github.com/tommyalvarez/thirdbase".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Seamless third database integration for Rails.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 4.0"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 4.0"])
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
  end
end
