RSpec.describe ValidatesAccessibility::Validator, "WCAG H59 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h59]
  end

  # All navigation links should be in the head element and also have a rel
  # attribute describing the link, as well as a href
  it "should be valid if a link in the head tag has rel and href attribute" do
    d = Document.new
    d.body = "<head><link rel='dog' href='cat'/></head>"
    expect(d).to be_valid
  end

  it "should be invalid if a link in the head tag has no rel attribute" do
    d = Document.new
    d.body = "<head><link rel='' href='cat'/></head>"
    expect(d).to be_invalid
  end

  it "should be invalid if a link in the head tag has no href attribute" do
    d = Document.new
    d.body = "<head><link rel='cat'/></head>"
    expect(d).to be_invalid
  end

end
