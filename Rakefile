require 'rubycritic_small_badge'
require 'rubycritic/rake_task'
RubyCriticSmallBadge.configure do |config|
  config.minimum_score = 95
end
RubyCritic::RakeTask.new do |task|
  task.options = %(--custom-format RubyCriticSmallBadge::Report
  --minimum-score #{RubyCriticSmallBadge.config.minimum_score})
  task.paths = FileList['app/**/*.rb']
end

task default: :rubycritic
