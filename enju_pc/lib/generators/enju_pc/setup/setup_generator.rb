class EnjuPc::SetupGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    copy_file("Procfile", "Procfile")
    generate("devise:install")
    generate("devise", "User")
    generate("friendly_id")
    generate("sunspot_rails:install")
    append_to_file("Rakefile", "require 'resque/tasks'\n")
    rake("enju_pc_engine:install:migrations")
  end
end
