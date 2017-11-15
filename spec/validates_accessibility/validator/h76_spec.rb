RSpec.describe ValidatesAccessibility::Validator, "WCAG H76 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h76]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if meta tags http-equiv equals 'refresh'" do
    d = Document.new
    d.body = '<meta http-equiv="Refresh"/>'
    expect(d).to be_valid
  end

  it "should be invalid if meta tags http-equiv does not equal 'refresh'" do
    d = Document.new
    d.body = '<meta http-equiv=""/>'
    expect(d).to be_invalid
  end

  it "should be invalid if meta tags has no http-equiv attribute" do
    d = Document.new
    d.body = '<meta/>'
    expect(d).to be_invalid
  end

end
