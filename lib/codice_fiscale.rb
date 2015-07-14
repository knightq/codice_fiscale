require 'codice_fiscale/version'
require 'codice_fiscale/validators/cf_format'
require 'codice_fiscale/railtie' if defined? Rails

# Validates italian fiscal code compliance
module CodiceFiscale
  MONTH_MAP = {
    'A' => '01', # Gennaio
    'B' => '02', # Febbraio
    'C' => '03', # Marzo
    'D' => '04', # Aprile
    'E' => '05', # Maggio
    'H' => '06', # Giugno
    'L' => '07', # Luglio
    'M' => '08', # Agosto
    'P' => '09', # Settembre
    'R' => '10', # Ottobre
    'S' => '11', # Novembre
    'T' => '12'  # Dicembre
  }

  def self.birthplace_part(cf)
    cf.to_s[11, 4]
  end

  def self.day_part(cf)
    cf.to_s[9, 2]
  end

  def self.month_part(cf)
    cf.to_s[8, 1]
  end

  def self.year_part(cf)
    cf.to_s[6, 2]
  end

  def self.female?(cf)
    !male?(cf)
  end

  def self.male?(cf)
    day_part(cf).to_i < 40
  end

  def self.birthdate(cf, century = '19')
    Date.parse(birthyear(cf, century) + birthmonth(cf) + birthday(cf))
  end

  def self.birthday(cf)
    male?(cf) ? day_part(cf) : (day_part(cf).to_i - 40).to_s
  end

  def self.birthmonth(cf)
    MONTH_MAP[month_part(cf)]
  end

  def self.birthyear(cf, century)
    century + year_part(cf)
  end
end
