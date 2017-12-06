require 'net/http'
require 'nokogiri'
require "prawn"

# Run all validation tests
def runErrorTests
  RSpec.describe ValidatesAccessibility::Validator, "Plugin" do
    before do
      Document.validates_accessibility_of :body
    end
    after do
      runWarningTests(@errors)
    end
    it "Testing accessiblity failures of "+ ENV['URL']+ENV['TEMPLATE'] do
      source = Net::HTTP.get(ENV['URL'], ENV['TEMPLATE']).to_s
      c = Document.new
      c.body = source
      expect(c).to be_invalid
      @errors = c.errors.messages[:body]
    end
  end
end

# Run all warning tests
def runWarningTests(errors)
  RSpec.describe WarningValidator::Warner, "Plugin" do
    before do
      Document.show_warnings_of :body
    end
    after do
      generatePDF(errors, @warnings)
    end
    it "Testing for accessiblity concerns "+ ENV['URL']+ENV['TEMPLATE'] do
      source = Net::HTTP.get(ENV['URL'], ENV['TEMPLATE']).to_s
      c = Document.new
      c.body = source
      expect(c).to be_invalid
      @warnings = c.errors.messages[:body]
    end
  end
end

def generatePDF(errors, warnings)
  Prawn::Document.generate("report.pdf") do
    text "ERRORS", :align => :center
    errors.each do |error|
      text error
    end

    text "\nWARNINGS", :align => :center
    warnings.each do |warning|
      text warning
    end
  end
end

runErrorTests

