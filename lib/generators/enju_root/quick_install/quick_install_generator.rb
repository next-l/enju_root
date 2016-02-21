class EnjuRoot::QuickInstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def quick_install
    environment = ENV['RAILS_ENV'] || 'development'
    rake("enju_root:install:migrations")
    rake("db:migrate", env: environment)
    rake("enju_root:setup", env: environment)
    rake("assets:precompile", env: environment) if environment == 'production'
    rake("db:seed", env: environment)
    if !ENV['ENJU_SKIP_SOLR']
      if ENV['OS'] == 'Windows_NT'
        rake("sunspot:solr:run", env: environment)
      else
        rake("sunspot:solr:start", env: environment)
        sleep 5
        rake("environment sunspot:reindex", env: environment)
        rake("sunspot:solr:stop", env: environment)
      end
    end
  end
end
