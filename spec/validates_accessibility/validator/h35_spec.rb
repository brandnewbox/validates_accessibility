RSpec.describe ValidatesAccessibility::Validator, "WCAG H35 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h35]
  end

  # Search the HTML source for <APPLET> or <OBJECT> or <EMBED> tags. 
  # For each <applet> element, note if there is an "alt" attribute or nested
  # content which provides the text equivalent.
  it "should not be valid if applet has neither alt or descriptive text" do
    d = Document.new
    d.body = '<applet></applet>'
    expect(d).to be_invalid
  end

  it "should not be valid if applet does not have alt" do
    d = Document.new
    d.body = '<applet>a cat</applet>'
    expect(d).to be_invalid
  end

  it "should be valid if applet does have alt and descriptive text" do
    d = Document.new
    d.body = '<applet alt="a cat">a cat</applet>'
    expect(d).to be_valid
  end

  it "should be invalid if applet does not have descriptive text"do
    d = Document.new
    d.body = '<applet alt="a cat"></applet>'
    expect(d).to be_invalid
  end
end