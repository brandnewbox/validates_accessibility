RSpec.describe ValidatesAccessibility::Validator, "WCAG H28 Standards" do
  before do
    Document.validates_accessibility_of :body
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if an abbr tag has title attribute" do
    d = Document.new
    d.body = '<abbr title="dog">www</abbr>'
    expect(d).to be_valid
  end

  it "should be invalid if an abbr tag has an empty title attribute" do
    d = Document.new
    d.body = '<abbr title="">wwww</abbr>'
    expect(d).to be_invalid
  end

  it "should be invalid if an abbr tag has no title attribute" do
    d = Document.new
    d.body = '<abbr>www</abbr>'
    expect(d).to be_invalid
  end


end
