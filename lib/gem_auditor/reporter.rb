require_relative 'diff'

module GemAuditor
  class Reporter
    def initialize(current_specs, actual_specs)
      @current_specs = current_specs.sort_by{|spec| spec.name}
      @actual_specs = actual_specs
    end

    def run
      res = difference
      if res.empty?
        "All gems are up-to-date"
      else
        puts "Outdated gems included in the bundle:"
        puts res.map{|diff| "* #{diff.name} (#{diff.actual_version} > #{diff.current_version})"}
        exit 1
      end

    end

    private

    def difference
      @current_specs.inject([]) do |res, current_spec|
        actual_version = @actual_specs[current_spec.name.to_sym]
        unless current_spec.version.to_s == actual_version
          res << GemAuditor::Diff.new(current_spec.name, current_spec.version, actual_version)
        end
        res
      end
    end
  end
end