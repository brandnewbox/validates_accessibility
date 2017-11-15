RSpec.describe ValidatesAccessibility::Validator, "WCAG H40 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h40]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if a term is described inside a dl tag" do
    d = Document.new
    d.body = '<dl><dt>dog</dt><dd>A fluffy animal</dd></dl>'
    expect(d).to be_valid
  end

  it "should be invalid if a term is described outside a dl tag" do
    d = Document.new
    d.body = '<dt>dog</dt><dd>A fluffy animal</dd>'
    expect(d).to be_invalid
  end


end