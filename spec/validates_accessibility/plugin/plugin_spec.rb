require 'net/http'
require 'nokogiri'

RSpec.describe ValidatesAccessibility::Validator, "Plugin" do
  before do
    Document.validates_accessibility_of :body
  end

  it "Testing accessiblity of "+ ENV['URL'] do
    source = Net::HTTP.get(ENV['URL'], '/index.html').to_s
    c = Document.new
    c.body = source
    expect(c).to be_invalid
    c.errors.messages[:body].each do |message|
      puts message
    end
  end


end