require "bundler/setup"
require "extend_warranties"

require 'rspec'
require 'rspec/its'
require 'vcr'
require 'webmock'

file_path = File.join(__dir__, 'env.yml')
if File.exist?(file_path)
  YAML.load_file(file_path).each do |key, value|
    ENV[key] ||= value
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<BASIC_AUTH>') do |interaction|
    interaction.request.headers['X-Extend-Access-Token'].first
  end
  config.default_cassette_options = { record: :once }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
