require 'active_record/fixtures'
namespace :enju_root do
  desc "create initial records for enju_root"
  task :setup => :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_root/*.yml').each do |file|
      ActiveRecord::Fixtures.create_fixtures('db/fixtures/enju_root', File.basename(file, '.*'))
    end

    puts 'initial fixture files loaded.'
  end
end
