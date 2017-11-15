RSpec.describe ValidatesAccessibility::Validator, "WCAG H64 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h64]
  end

  # Each iframe and frame tag should have a title attribute
  it "should be valid an iframe has a non-empty title attribute" do
    d = Document.new
    d.body = '<iframe title="dog"></iframe>'
    expect(d).to be_valid
  end

  it "should be valid a frame has a non-empty title attribute" do
    d = Document.new
    d.body = '<frame title="dog"></frame>'
    expect(d).to be_valid
  end

  it "should be invalid an iframe has an empty title attribute" do
    d = Document.new
    d.body = '<iframe title=""></iframe>'
    expect(d).to be_invalid
  end

  it "should be invalid a frame has an empty title attribute" do
    d = Document.new
    d.body = '<iframe title=""></iframe>'
    expect(d).to be_invalid
  end

  it "should be invalid a frame has no title attribute" do
    d = Document.new
    d.body = '<iframe></iframe>'
    expect(d).to be_invalid
  end

  it "should be invalid a frame has no title attribute" do
    d = Document.new
    d.body = '<frame></frame>'
    expect(d).to be_invalid
  end

end