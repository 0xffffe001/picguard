require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
SimpleCov.start do
  add_filter '/lib/google/apis'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'picguard'
require 'pry'
require 'support/result_hash_stub'
