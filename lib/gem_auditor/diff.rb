module GemAuditor
  class Diff < Struct.new(:name, :current_version, :actual_version)
  end
end