# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'pry'
require 'memory_logger'
require 'bunny-mock'
require 'rake'
require File.join(File.dirname(__FILE__), "../lib/daemon_objects.rb")

DaemonObjects.initialize_environment

SPEC_PATH = File.dirname(__FILE__)
Dir[File.join(SPEC_PATH, "support/**/*.rb")].each{|f| require f}

FIXTURES_PATH = File.join(SPEC_PATH, "fixtures")

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before :each do
    DaemonObjects.initialize_environment
    DaemonObjects.instance_variable_set(:@config, nil)
  end
end
