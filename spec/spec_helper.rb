require 'user_fullname'
require 'support/randomizer'
require 'coveralls'
Coveralls.wear!
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
