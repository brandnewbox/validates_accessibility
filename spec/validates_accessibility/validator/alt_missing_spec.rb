RSpec.describe ValidatesAccessibility::Validator, ":alt_missing option" do
  before do
    Document.validates_accessibility_of :body
  end

  it "should not be valid if image alternative text is not present" do
    d = Document.new
    d.body = 'dog'
    expect(d).to be_invalid
  end

  it "should be valid if image alternative text is present" do
    # valid!(:body, "<img src='https://www.petfinder.com/wp-content/uploads/2012/11/91615172-find-a-lump-on-cats-skin-632x475.jpg' alt='A Cat' />")
    d = Document.new
    d.body = "cat"
    expect(d).to be_valid
  end
end