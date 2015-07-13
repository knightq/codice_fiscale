# codice_fiscale
Utility to check italian fiscal code on Rails 3+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codice_fiscale', '~> 1.0'
```

And then execute:

    $ bundle

## Usage

```ruby
class Person < ActiveRecord::Base
  validates :cf, presence: true, cf_format: true
end
```

## Available Validators

* `cf_format`: The Italian Tax code is called "Codice Fiscale".
For more information see [wikipedia](http://en.wikipedia.org/wiki/Italian_fiscal_code_card).
