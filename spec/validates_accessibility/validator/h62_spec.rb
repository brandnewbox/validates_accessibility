RSpec.describe ValidatesAccessibility::Validator, "WCAG H62 Standards" do
  before do
    Document.validates_accessibility_of :body, only: [:h62]
  end

  # All Ruby elements must have an rt element for every rb and an rp element
  it "should be valid if a ruby tag has the same number of rb tags and rt tags, as well as at least one rp" do
    d = Document.new
    d.body = "<ruby><rb>dog</rb><rp><rt>fluffy animal</rt></rp><rb>cat</rb><rp><rt>small animal</rt></rp></ruby>"
    expect(d).to be_valid
  end

  it "should be invalid if a ruby tag has a different number of rb tags and rt tags, as well as at least one rp" do
    d = Document.new
    d.body = "<ruby><rp><rt>fluffy animal</rt></rp><rb>cat</rb><rp><rt>small animal</rt></rp></ruby>"
    expect(d).to be_invalid
  end

  it "should be valid if a ruby tag has the same number of rb tags and rt tags, as well as no rp tag" do
    d = Document.new
    d.body = "<ruby><rb>dog</rb><rt>fluffy animal</rt><rb>cat</rb><rt>small animal</rt></ruby>"
    expect(d).to be_invalid
  end

  it "should be invalid if a ruby tag has a different number of rb tags and rt tags, as well as no rp tags" do
    d = Document.new
    d.body = "<ruby><rt>fluffy animal</rt><rb>cat</rb><rt>small animal</rt></ruby>"
    expect(d).to be_invalid
  end

end
