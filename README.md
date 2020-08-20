# README : Kasey Test Harness

This repo exists to test and develop the `kasey` engine, found
[here](https://github.com/beflagrant/kasey). Kasey is a git submodule,
so any changes can evolve independently.

The meat of the app comes from Kasey's original `test/dummy` application,
but this proved unwieldy.

# Getting Started

This application was developed with Ruby 2.7.1, and Rails 6.0.3 initially. It
runs using sqlite3.

```
$> git submodule update --init
$> bundle
$> bin/rails db:create db:migrate
$> bundle exec rspec
$> bin/rails s
```

# Steps to Create

```bash
$> rails new -S kasey-test-dummy
$> cd kasey-test-dummy
$> git submodule add git@github.com:beflagrant/kasey vendor/kasey
```

add `gem 'kasey', path: 'vendor/kasey'` to Gemfile

also update Gemfile with:

- `rspec-rails`
- `shoulda-matchers`
- `pry`
- `devise`
- update `webpacker` version to `'~> 5.2'`

```bash
$> bundle
$> bin/rails webpacker:install # overwrite everything
$> bin/rails active_storage:install
$> bin/rails action_mailbox:install
$> bin/rails action_text:install
$> bin/rails db:migrate
$> bin/rails rspec:install
$> bin/rails g devise:install
$> bin/rails g kasey:install
$> bin/rails g devise User
```

The file `config/initializers/kasey.rb` was updated to reflect Devise methods,
since that's what we're using.

At this point, we have a basic install, with minimal configuration.

As this repo will take over from kasey/test/dummy, we import the controllers,
models, routes, and specs.
