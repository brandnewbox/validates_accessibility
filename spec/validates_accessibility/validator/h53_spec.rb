RSpec.describe ValidatesAccessibility::Validator, "WCAG H53 Standards" do
  before do
    Document.validates_accessibility_of :body
  end

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
    d.body = '<embed /><noembed></noembed>'
    expect(d).to be_invalid
  end
  it "should not be valid if embed alt attribute is empty" do
    d = Document.new
    d.body = '<embed alt="" /><noembed></noembed>'
    expect(d).to be_invalid
  end
  it "should be valid if embed alt attribute is present" do
    d = Document.new
    d.body = '<embed alt="a cat" /><noembed></noembed>'
    expect(d).to be_valid
  end
end