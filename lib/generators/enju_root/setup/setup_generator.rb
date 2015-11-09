class EnjuRoot::SetupGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_root")
    generate("devise:install")
    generate("devise", "User")
    generate("sunspot_rails:install")
    generate("kaminari:config")
    generate("kaminari:views bootstrap3")

    inject_into_class "app/controllers/application_controller.rb", ApplicationController do
      <<"EOS"

  include Pundit

EOS
    end

    application(nil, env: "development") do
      "config.action_mailer.default_url_options = {host: 'localhost:3000'}\n"
    end
    application(nil, env: "test") do
      "config.action_mailer.default_url_options = {host: 'localhost:3000'}\n"
    end
    application(nil, env: "production") do
      "config.action_mailer.default_url_options = {host: 'localhost:3000'}\n"
    end
  end
end
