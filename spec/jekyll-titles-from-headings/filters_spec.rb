RSpec.describe JekyllTitlesFromHeadings::Filters do
  let(:site) { fixture_site("site") }
  subject { described_class.new(site) }

  it "markdownifies" do
    html = subject.markdownify("# test")
    expect(html).to eql("<h1 id=\"test\">test</h1>\n")
  end

  it "strips html" do
    string = subject.strip_html("<h1>test</h1>")
    expect(string).to eql("test")
  end

  it "normalizes whitespace" do
    string = subject.normalize_whitespace("test    test")
    expect(string).to eql("test test")
  end
end
