RSpec.describe ValidatesAccessibility::Validator, ":silly option" do
  before do
    # Document.validates_accessibility_of :body
  end

  it "should be valid" do
    d = Document.new
    d.body = 'dog'
    expect(d).to be_valid
  end
end