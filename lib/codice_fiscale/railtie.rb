module CodiceFiscale
  class Railtie < Rails::Railtie
    initializer 'codice_fiscale.configure_rails_initialization' do
      ActiveSupport.on_load :active_record do
        extend CodiceFiscale
      end
    end
  end
end
