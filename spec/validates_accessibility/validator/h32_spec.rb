RSpec.describe ValidatesAccessibility::Validator, "WCAG H32 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h32]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if a form has a submit button" do
    d = Document.new
    d.body = "<form><input type='submit'/></form>"
    d.valid?
    puts d.errors.inspect
    expect(d).to be_valid
  end

  it "should be invalid if a form does not have a submit button" do
    d = Document.new
    d.body = "<form><input type=text'/></form>"
    expect(d).to be_invalid
  end

end
