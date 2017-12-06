RSpec.describe WarningValidator::Validator, "WCAG H69 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h69]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if a document uses headers to separate content" do
    d = Document.new
    d.body = '<h1>dog</h1>'
    expect(d).to be_valid
  end

  it "should be invalid if a document does not use headers to separate content" do
    d = Document.new
    d.body = '<p>hello</p>'
    expect(d).to be_invalid
  end

end
