require 'rake'
require_relative "../gem_auditor/gem_info_getter"
require_relative "../gem_auditor/reporter"

namespace :gem_auditor do
  desc 'Check outdated gem versions'
  task :check_outdated_gems do
    current_specs = Bundler.load.specs
    actual_specs = GemAuditor::GemInfoGetter.new(current_specs.map(&:name)).run.actual_specs
    GemAuditor::Reporter.new(current_specs, actual_specs).run
  end
end