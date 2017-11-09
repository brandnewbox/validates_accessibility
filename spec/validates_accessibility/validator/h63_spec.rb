RSpec.describe ValidatesAccessibility::Validator, "WCAG H63 Standards" do
  before do
    Document.validates_accessibility_of :body
  end

  # For each <object> element, note if there is nested content which provides
  # the text equivalent.
  it "should be valid if all th's in a table have the correct scope attribute" do
    d = Document.new
    d.body = '<table><caption>Hello</caption>
              <tr><th scope="row"></th></tr>
              <tr><th scope="col"></th></tr>
              <tr><th scope="rowgroup"></th></tr>
              <tr><th scope="colgroup"></th></tr>
              </table>'
    expect(d).to be_valid
  end

  it "should not be valid if all th's in a table do nothave the correct scope attribute" do
    d = Document.new
    d.body = '<table><caption>Hello</caption>
              <tr><th scope="fds"></th></tr>
              <tr><th scope="bdf"></th></tr>
              <tr><th scope="rowgroup"></th></tr>
              <tr><th scope="colgroup"></th></tr>
              </table>'
    expect(d).to be_valid
  end

  it "should not be valid if all th's in a table do not have a scope attribute" do
    d = Document.new
    d.body = '<table><caption>Hello</caption>
              <tr><th></th></tr>
              <tr><th scope="bdf"></th></tr>
              <tr><th scope="rowgroup"></th></tr>
              <tr><th scope="colgroup"></th></tr>
              </table>'
    expect(d).to be_valid
  end

end