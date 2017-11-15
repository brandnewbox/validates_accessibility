require 'net/http'
require 'nokogiri'

RSpec.describe ValidatesAccessibility::Validator, "Plugin" do
  before do
    Document.validates_accessibility_of :body
  end

  it "Testing outside website" do
    source = Net::HTTP.get('markvanlan.com', '/index.html').to_s
    c = Document.new
    c.body = source
    # puts c.inspect
    expect(c).to be_invalid
  end


end