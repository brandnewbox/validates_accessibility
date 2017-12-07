require 'net/http'
require 'nokogiri'
require "prawn"

analysis = Analysis.new(Net::HTTP.get(ENV['URL'], ENV['TEMPLATE']).to_s, nil)
analysis.runErrorTests
analysis.runWarningTests
