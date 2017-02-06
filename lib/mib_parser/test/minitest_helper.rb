if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter '/.bundle/'
    add_filter '/test/'
    command_name 'MiniTest'
    minimum_coverage 75
  end
end

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/reporters'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mib_parser'

Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new(color: true)]
