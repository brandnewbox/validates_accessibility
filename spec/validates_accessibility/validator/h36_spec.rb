RSpec.describe ValidatesAccessibility::Validator, "WCAG H36 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h36]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if an input with type image has alt attribute" do
    d = Document.new
    d.body = "<input type='image' alt='a dog'/>"
    d.valid?
    expect(d).to be_valid
  end

  it "should be valid if an input without type image has no alt attribute" do
    d = Document.new
    d.body = "<input type='text'/>"
    d.valid?
    expect(d).to be_valid
  end

  it "should be invalid if an input with type image has no alt attribute" do
    d = Document.new
    d.body = "<input type='image'/>"
    d.valid?
    expect(d).to be_invalid
  end

end
