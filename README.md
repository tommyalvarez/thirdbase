
![SecondBase Logo](https://cloud.githubusercontent.com/assets/2381/12219457/5a5aab4e-b712-11e5-92e1-de6487aa0809.png)
<hr>
Seamless third database integration for Rails. ThirdbaseBase provides support for Rails to manage one more database by extending ActiveRecord tasks that create, migrate, and test your databases.

* [Using SecondBase To Provide Some Level Of Sanity](http://technology.customink.com/blog/2016/01/10/two-headed-cat-using-secondbase-to-provide-some-level-of-sanity-in-a-two-database-rails-application/)
* [Rails Multi-Database Best Practices Roundup](http://technology.customink.com/blog/2015/06/22/rails-multi-database-best-practices-roundup/)

[![Gem Version](https://badge.fury.io/rb/secondbase.png)](http://badge.fury.io/rb/secondbase)
[![Build Status](https://travis-ci.org/customink/secondbase.svg?branch=master)](https://travis-ci.org/customink/secondbase)


## Usage

To get started with your new third database, update your database.yml to include a `thirdbase` config key. All ThirdBase configurations per Rails environment go under this config key.

```yaml
# Default configurations:
development:
  adapter: sqlserver
  database: myapp_development
test:
  adapter: sqlserver
  database: myapp_test
# ThirdbaseBase configurations:
thirdbase:
  development:
    adapter: mysql
    database: myapp_development
  test:
    adapter: mysql
    database: myapp_test
```

#### Database Tasks

ThirdBase aims to work seamlessly within your Rails application. When it makes sense, we run a mirrored `db:third_base` task for matching ActiveRecord base database task. These can all be deactivated by setting `config.third_base.run_with_db_tasks = false` in your Application's configuration. For example:

```shell
$ rake db:create
```

This will not only create your base development database, but it will also create your second database as specified by the configuration within the `:thirdbase` section of your database.yml. Below is a complete list of `:db` tasks that automatically run a mirrored `:db:third_base` task. Some private or over lapping tasks, like schema dump/loading or `db:setup`, are not listed.

* db:create
* db:create:all
* db:drop
* db:drop:all
* db:purge
* db:purge:all
* db:migrate
* db:test:purge
* db:test:prepare
* db:schema:cache:dump

Not all base database tasks make sense to run a mirrored ThirdBase task. These include tasks that move a single migration up/down, reporting on your database's current status/version, and others. These tasks have to be run explicitly and only operate on your ThirdBase database. Each support any feature that their matching `:db` task has. For example, using `VERSION=123` to target a specific migration.

* db:third_base:migrate:up
* db:third_base:migrate:down
* db:third_base:migrate:reset
* db:third_base:migrate:redo
* db:third_base:migrate:status
* db:third_base:rollback
* db:third_base:forward
* db:third_base:version

#### Migration Generator

ThirdBase migrations are stored in your application's `db/thirdbase/migrate` directory. Likewise, ThirdBase will also dump your schema/structure file into the `db/thirdbase` directory. Full support for ActiveRecord's schema format being set to either `:ruby` or `:sql` is supported.

Migrations can be generated using the `third_base:migration` name. Our generator is a subclass of ActiveRecord's. This means the ThirdBase migration generator supports whatever features and arguments are supported by your current Rails version. For example:

```shell
$ rails generate third_base:migration CreateWidgetsTable
$ rails generate third_base:migration AddTitleBodyToPost title:string body:text
```

#### Models

Any model who's table resides in your second database needs to inherit from `ThirdBase::Base`. ActiveRecord associations will still work between your base ActiveRecord and SecondBase models!

```ruby
class Widget < ThirdBase::Base

end

class User < ActiveRecord::Base
  has_many :widgets
end
```

#### Forced Connections

Sometimes you want to force a model that inherits from `ActiveRecord::Base` to use the `ThirdBase::Base` connection. Using the `ThirdBase::Forced` module is a great way to accomplish this. By using this module, we do all the work to ensure the connection, management, and pool are properly freedom patched.

We recomend forcing modules using a Rails initializer. This example below forces both the [DelayedJob ActiveRecord Backend](https://github.com/collectiveidea/delayed_job_active_record) and ActiveRecord session store to use your ThirdBase database.

```ruby
# In config/initializers/third_base.rb
Delayed::Backend::ActiveRecord::Job.extend ThirdBase::Forced
ActiveRecord::SessionStore::Session.extend ThirdBase::Forced
```

#### Testing & DB Synchronization

Rails 4.2 brought about a new way to keep your test database in sync by checking schema migrations. Where previously forcing a full test database schema load, Rails 4.2 and up is able to run your tests much faster. In order for ThirdBase to take advantage of this, you will need to include our test help file directly following the Rails one. Open your `test_helper.rb` and add our `third_base/test_help` after `rails/test_help`.

```ruby
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'third_base/test_help'
```

#### Configurations

All ThirdBase railtie settings are best done in a `config/application.rb` file. We support the following configurations:

```ruby
config.third_base.path        # Default: 'db/thirdbase'
config.third_base.config_key  # Default: 'thirdbase'
```

* `path` - Used as location for migrations & schema. Path is relative to application root.
* `config_key` - The key to in database.yml/configurations to search for ThirdBase configs.


## Advanced Usage

#### Twelve-Factor & DATABASE_URL

We love the [Twelve Factors](http://12factor.net) principals and using tools like Dotenv with Rails. Using ThirdBase does not mean you have to abandon these best practices. You will however need to take advantage of a [new feature](https://github.com/rails/rails/pull/14633) in Rails 4.1 and upward that allows database.yml configurations to leverage a `:url` key that will resolve and merge the same connection string format consumed by `DATABASE_URL`. For example: 

```yaml
development:
  database: encom-pg_development
  url: <%= ENV.fetch('DATABASE_URL') %>
test:
  database: encom-pg_test
  url: <%= ENV.fetch('DATABASE_URL') %>
production:
  url: <%= ENV.fetch('DATABASE_URL') %>

thirdbase:
  development:
    database: encom-mysql_development
    url: <%= ENV.fetch('DATABASE_URL_THIRDBASE') %>
  test:
    database: encom-mysql_test
    url: <%= ENV.fetch('DATABASE_URL_THIRDBASE') %>
  production:
    url: <%= ENV.fetch('DATABASE_URL_THIRDBASE') %>
```

There are many ways to use Dotenv and enviornment variables. This is only one example and we hope it helps you decide on which is best for you.

#### The ActiveRecord Query Cache

Rails only knows about your base connection for the Rack-based query cache. In order to take advantage of this feature for your ThirdBase, you will need to set an arround filter in your controller. I don't recommend this since there's an active issue with performance loading the schema, from the original gem => SecondBase

```ruby
class ApplicationController < ActionController::Base
  around_filter :query_cache_thirdBase
  private
  def query_cache_secondBase
    ThirdBase::Base.connection.cache { yield }
  end
end
```

## Versions

The current master branch is for Rails v4.0.0 and up and. We have older work in previous v1.0 releases which partial work for Rails 3.2 or lower. These old versions are feature incomplete and are not supported.


## Contributing

We use the [Appraisal](https://github.com/thoughtbot/appraisal) gem from Thoughtbot to help us test different versions of Rails. The `rake appraisal test` command actually runs our test suite against all Rails versions in our `Appraisal` file. So after cloning the repo, running the following commands.

```shell
$ bundle install
$ bundle exec appraisal update
$ bundle exec appraisal rake test
```

If you want to run the tests for a specific Rails version, use one of the appraisal names found in our `Appraisals` file. For example, the following will run our tests suite for Rails 4.1.x.

```shell
$ bundle exec appraisal rails41 rake test
```

