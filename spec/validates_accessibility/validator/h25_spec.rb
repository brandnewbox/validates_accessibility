RSpec.describe ValidatesAccessibility::Validator, "WCAG H24 Standards" do
  before do
    Document.validates_accessibility_of :body
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if a head tag has a title" do
    d = Document.new
    d.body = '<head><title>a dog</title></head>'
    expect(d).to be_valid
  end

  it "should be invalid if a head tag has an empty title" do
    d = Document.new
    d.body = '<head><title></title></head>'
    expect(d).to be_invalid
  end

  it "should be invalid if a head tag has no title" do
    d = Document.new
    d.body = '<head></head>'
    expect(d).to be_invalid
  end

end