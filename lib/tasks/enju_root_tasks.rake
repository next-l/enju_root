require 'active_record/fixtures'

namespace :enju_root do
  desc "create initial records for enju_root"
  task setup: :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_root/*.yml').each do |file|
      ActiveRecord::FixtureSet.create_fixtures('db/fixtures/enju_root', File.basename(file, '.*'))
    end
  end
end
