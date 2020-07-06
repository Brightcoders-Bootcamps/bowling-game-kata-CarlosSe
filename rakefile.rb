require 'rubycritic_small_badge'
require 'rubycritic/rake_task'
task :default do
  RubyCriticSmallBadge.configure do |config|
    config.minimum_score = 95
  end
  RubyCritic::RakeTask.new do |task|
    task.options = %(--custom-format RubyCriticSmallBadge::Report
  --minimum-score #{RubyCriticSmallBadge.config.minimum_score})
  end
end