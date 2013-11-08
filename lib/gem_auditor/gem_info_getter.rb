require 'json'
require 'hydra'
require 'typhoeus'
module GemAuditor
  class GemInfoGetter
    attr_reader :actual_specs

    def initialize(gem_names)
      @gem_names = gem_names
      @actual_specs = {}
    end

    def run
      hydra = Typhoeus::Hydra.new(max_concurrency: 10)
      @gem_names.each do |name|
        req = Typhoeus::Request.new("https://rubygems.org/api/v1/gems/#{name}.json")
        req.on_complete do |response|
          @actual_specs[name.to_sym] = JSON.parse(response.body)["version"] rescue nil
        end
        hydra.queue req
      end
      hydra.run
      self
    end
  end
end