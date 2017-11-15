RSpec.describe ValidatesAccessibility::Validator, "WCAG H91 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h91]
  end

  it "should be valid if a input type button has non-empty value attribute" do
    d = Document.new
    d.body = '<input type="button" value="dog"/>'
    expect(d).to be_valid
  end

  it "should be invalid if a input type button has no value attribute" do
    d = Document.new
    d.body = '<input type="button"/>'
    expect(d).to be_invalid
  end

  it "should be valid if a input type submit has non-empty value attribute" do
    d = Document.new
    d.body = '<input type="submit" value="dog"/>'
    expect(d).to be_valid
  end

  it "should be invalid if a input type submit has no value attribute" do
    d = Document.new
    d.body = '<input type="submit" value=""/>'
    expect(d).to be_invalid
  end

  it "should be valid if a input type reset has non-empty value attribute" do
    d = Document.new
    d.body = '<input type="reset" value="dog"/>'
    expect(d).to be_valid
  end

  it "should be invalid if a input type reset has no value attribute" do
    d = Document.new
    d.body = '<input type="reset" value=""/>'
    expect(d).to be_invalid
  end

  it "should be valid if a input type file has non-empty value attribute" do
    d = Document.new
    d.body = '<input type="file" value="dog"/>'
    expect(d).to be_valid
  end

  it "should be invalid if a input type file has no value attribute" do
    d = Document.new
    d.body = '<input type="file" value=""/>'
    expect(d).to be_invalid
  end

  it "should be valid if a select tag has one selected option" do
    d = Document.new
    d.body = '<select><option selected="selected"/><option /></select>'
    expect(d).to be_valid
  end

  it "should be invalid if a select tag has no selected option" do
    d = Document.new
    d.body = '<select><option /><option /></select>'
    expect(d).to be_invalid
  end

  
end
