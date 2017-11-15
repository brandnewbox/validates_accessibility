RSpec.describe ValidatesAccessibility::Validator, "WCAG H93 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h91]
  end

  it "should be valid if a input type button has non-empty value attribute" do
    d = Document.new
    d.body = '<input type="button" value="dog"/>'
    expect(d).to be_valid
  end

  
end