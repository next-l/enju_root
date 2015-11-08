class EnjuRoot::SetupGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    generate("devise:install")
    generate("devise", "User")

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
