RSpec.describe ValidatesAccessibility::Validator, "WCAG H73 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h73]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if a tables summary and caption are different" do
    d = Document.new
    d.body = '<table summary="cat"><caption>dog</caption></table>'
    expect(d).to be_valid
  end

  it "should be valid if a table has a non-empty summary attribute" do
    d = Document.new
    d.body = '<table summary="cat"></table>'
    expect(d).to be_valid
  end

  it "should be valid if a table has no summary attribute" do
    d = Document.new
    d.body = '<table><caption>cat</caption></table>'
    expect(d).to be_valid
  end


  it "should be invalid if a tables summary and caption are equivalent" do
    d = Document.new
    d.body = '<table summary="cat"><caption>cat</caption></table>'
    expect(d).to be_invalid
  end

  it "should be invalid if a tables has an empty summary attribute" do
    d = Document.new
    d.body = '<table summary=""><caption>cat</caption></table>'
    expect(d).to be_invalid
  end
  
end
