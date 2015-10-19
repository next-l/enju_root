require 'devise'
require 'kaminari'
require 'sunspot_rails'
require 'acts_as_list'
require 'refile/rails'
require 'refile/mini_magick'
require 'ruby-graphviz'
require 'addressable/uri'

module EnjuRoot
  class Engine < ::Rails::Engine
    isolate_namespace EnjuRoot
  end
end
