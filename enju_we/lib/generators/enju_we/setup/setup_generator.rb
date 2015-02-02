class EnjuWe::SetupGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    copy_file("Procfile", "Procfile")
    generate("friendly_id")
    append_to_file("Rakefile", "require 'resque/tasks'\n")
    rake("enju_we_engine:install:migrations")
  end
end
