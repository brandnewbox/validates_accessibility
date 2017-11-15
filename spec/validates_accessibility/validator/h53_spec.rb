RSpec.describe ValidatesAccessibility::Validator, "WCAG H53 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h53]
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

end