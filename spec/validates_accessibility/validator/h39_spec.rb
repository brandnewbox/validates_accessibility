RSpec.describe ValidatesAccessibility::Validator, "WCAG H39 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h39]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if table has a non-empty caption" do
    d = Document.new
    d.body = '<table><caption>Hello</caption></table>'
    expect(d).to be_valid
  end

  it "should not be valid if table has an empty caption" do
    d = Document.new
    d.body = '<table><caption></caption></table>'
    expect(d).to be_invalid
  end

  it "should not be valid if table has no caption" do
    d = Document.new
    d.body = '<table></table>'
    expect(d).to be_invalid
  end

end
