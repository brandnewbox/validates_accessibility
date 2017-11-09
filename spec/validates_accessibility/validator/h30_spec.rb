RSpec.describe ValidatesAccessibility::Validator, "WCAG H30 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h32]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if a link has descriptive text" do
    d = Document.new
    d.body = "<a>this is a link</a>"
    d.valid?
    puts d.errors.inspect
    expect(d).to be_valid
  end

  it "should be valid if a link has an image with a descriptive alt attribute" do
    d = Document.new
    d.body = "<a><img alt='text'/></a>"
    expect(d).to be_valid
  end

  it "should be valid if a link has descriptive text and images with no alt attribute" do
    d = Document.new
    d.body = "<a>this is a link<img/></a>"
    expect(d).to be_valid
  end

  it "should be invalid if a link has no descriptive text or images with no alt attribute" do
    d = Document.new
    d.body = "<a><img/></a>"
    expect(d).to be_invalid
  end

end
