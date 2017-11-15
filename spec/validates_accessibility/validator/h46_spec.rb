RSpec.describe ValidatesAccessibility::Validator, "WCAG H46 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h46]
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if embed has noembed child " do
    d = Document.new
    d.body = '<embed alt="a cat"><noembed></noembed></embed>'
    expect(d).to be_valid
  end

  it "should be valid if embed has noembed directly following " do
    d = Document.new
    d.body = '<embed alt="a cat"></embed><noembed></noembed>'
    expect(d).to be_valid
  end

  it "should not be valid if embed does not have noembed directly following and no noembed child" do
    d = Document.new
    d.body = '<embed alt="a cat"></embed>'
    expect(d).to be_invalid
  end
end