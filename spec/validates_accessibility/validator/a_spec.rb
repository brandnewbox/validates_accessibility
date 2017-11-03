RSpec.describe ValidatesAccessibility::Validator, "1194.22 (a) Standards" do
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

  # Search the HTML source for image maps (image with an "ismap" or "usemap"
  # attribute). For each map, note if there is an "alt" text equivalent
  # provided for all active links. Note if adequate alternative text is
  # contained within the element content.
  it "should not be valid if image maps do not have alt attributes"
  it "should be valid if image maps do have alt attributes"

  # Search the HTML source for <APPLET> or <OBJECT> or <EMBED> tags. 
  # For each <applet> element, note if there is an "alt" attribute or nested
  # content which provides the text equivalent.
  it "should not be valid if applet has neither alt or descriptive text"
  it "should be valid if applet has alt"
  it "should be valid if applet has descriptive text"

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should not be valid if object does not have nested content" do
    d = Document.new
    d.body = '<object></object>'
    expect(d).to be_invalid
  end
  it "should be valid if object does have nested content" do
    d = Document.new
    d.body = '<object>Hello World</object>'
    expect(d).to be_valid
  end

  # For each <embed> element, note if there is an "alt" attribute.
  it "should not be valid if embed alt attribute is not present" do
    d = Document.new
    d.body = '<embed />'
    expect(d).to be_invalid
  end
  it "should not be valid if embed alt attribute is empty" do
    d = Document.new
    d.body = '<embed alt="" />'
    expect(d).to be_invalid
  end
  it "should be valid if embed alt attribute is present" do
    d = Document.new
    d.body = '<embed alt="a cat" />'
    expect(d).to be_valid
  end
end