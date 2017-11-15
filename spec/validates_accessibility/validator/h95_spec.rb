RSpec.describe ValidatesAccessibility::Validator, "WCAG H95 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h95]
  end

  # Search the HTML source for <APPLET> or <OBJECT> or <EMBED> tags. 
  # For each <applet> element, note if there is an "alt" attribute or nested
  # content which provides the text equivalent.
  it "should be valid if video has track with kind captions" do
    d = Document.new
    d.body = '<video><track kind="captions"></track></video>'
    expect(d).to be_valid
  end

  it "should not be valid if video has track without kind captions" do
    d = Document.new
    d.body = '<video><track></track></video>'
    expect(d).to be_invalid
  end

  it "should not be valid if video does not have track" do
    d = Document.new
    d.body = '<video></video>'
    expect(d).to be_invalid
  end

end