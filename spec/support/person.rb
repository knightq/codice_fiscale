# Fake person for testing purpose
class Person < ActiveRecord::Base
  # attr_accessible :codice_fiscale

  validates :cf, cf_format: true
end
