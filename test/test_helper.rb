require 'bundler'
Bundler.require :default, :test
require 'minitest/autorun'
require 'minitest/unit'

require 'mocha/mini_test'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
