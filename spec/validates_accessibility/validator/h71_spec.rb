RSpec.describe ValidatesAccessibility::Validator, "WCAG H71 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h71]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if a document uses fieldset tags for logically groups inputs" do
    d = Document.new
    d.body = '<fieldset><input type="text"/><input type="text"/></fieldset>'
    expect(d).to be_valid
  end

  it "should be invalid if a document does not use fieldset tags for logically groups inputs" do
    d = Document.new
    d.body = '<input type="text"/><input type="text"/>'
    expect(d).to be_invalid
  end

end
