RSpec.describe ValidatesAccessibility::Validator, "1194.22 (a) Standards" do
  before do
    Document.validates_accessibility_of :body
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if input an associated label and has no title" do
    d = Document.new
    d.body = '<label for="cat"></label><input id="cat">'
    expect(d).to be_valid
  end

  it "should be valid if input's parent is a label and has no title" do
    d = Document.new
    d.body = '<label><input></label>'
    expect(d).to be_valid
  end

  it "should be invalid if input does not have a label and has no title" do
    d = Document.new
    d.body = '<input>'
    expect(d).to be_invalid
  end

  it "should be valid if input does not have a label and has a title" do
    d = Document.new
    d.body = '<input title="a cat">'
    expect(d).to be_valid
  end
end

