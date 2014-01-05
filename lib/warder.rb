require 'ostruct'
require 'warder/version'
require 'warder/runner'
require 'warder/style_guide_runner'
require 'warder/magick_numbers_runner'
require 'warder/code_duplication_runner'
require 'warder/code_smells_runner'
require 'warder/code_complexity_runner'
require 'warder/bundle_audit_runner'
require 'warder/cli/arguments'
require 'warder/cli'

# scope for validators
module Warder
  def self.validators
    Warder.constants.grep(/\w+Runner/).map do |validator|
      Warder.const_get(validator)
    end
  end
end
