RSpec.describe ValidatesAccessibility::Validator, "WCAG H46 Standards" do
  before do
    Document.validates_accessibility_of :body
  end

  # A text equivalent for every non-text element shall be provided (e.g., via
  # "alt", "longdesc", or in element content).

  # Search the HTML source for "IMG" tags. For each IMG, note if there is an
  # "alt" or "longdesc" attribute. The "alt" attribute should always be
  # present (although for spacer and other non-content images, the value of
  # "alt" should be ALT=""). The "longdesc" attribute is optional, and should
  # be used when the text needed to describe the function of the graphic is
  # too long for an alt text. The longdesc can also optionally be used to
  # describe visual information not critical to page comprehension or use.
  # Note if adequate alternative text is contained within the element content.
  it "should not be valid if image alt attribute is not present" do
    d = Document.new
    d.body = '<img />'
    expect(d).to be_invalid
  end
  it "should not be valid if image alt attribute is empty" do
    d = Document.new
    d.body = '<img alt="" />'
    expect(d).to be_invalid
  end
  it "should be valid if image alt attribute is present" do
    d = Document.new
    d.body = '<img alt="a cat" />'
    expect(d).to be_valid
  end
end