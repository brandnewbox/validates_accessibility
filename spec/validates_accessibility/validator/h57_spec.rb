RSpec.describe ValidatesAccessibility::Validator, "WCAG H57 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h57]
  end

  it "should be valid if the html element has lang attribute" do
    d = Document.new
    d.body = '<html lang="en"></html>'
    expect(d).to be_valid
  end

  # it "should be valid if the html element has xml:lang attribute" do
  #   d = Document.new
  #   d.body = '<html xml:lang="en"></html>'
  #   expect(d).to be_valid
  # end

  it "should be invalid if the html element has empty lang attribute" do
    d = Document.new
    d.body = '<html lang=""></html>'
    expect(d).to be_invalid
  end

  it "should be invalid if the html element has no lang attribute" do
    d = Document.new
    d.body = '<html"></html>'
    expect(d).to be_invalid
  end

end
