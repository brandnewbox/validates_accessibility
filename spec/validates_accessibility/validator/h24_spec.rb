RSpec.describe ValidatesAccessibility::Validator, "WCAG H24 Standards" do
  before do
    Document.validates_accessibility_of :body
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if all area tags have an alt attribute" do
    d = Document.new
    d.body = '<area alt="dog"/>'
    expect(d).to be_valid
  end

  it "should be invalid if an area tag has an empty alt attribute" do
    d = Document.new
    d.body = '<area alt=""/>'
    expect(d).to be_invalid
  end

  it "should be invalid if an area tag does not have an alt attribute" do
    d = Document.new
    d.body = '<area/>'
    expect(d).to be_invalid
  end

end