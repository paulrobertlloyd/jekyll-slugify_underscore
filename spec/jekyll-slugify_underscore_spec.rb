require 'spec_helper'

describe(Jekyll) do
  let(:overrides) do
    {
      "source"      => source_dir,
      "destination" => dest_dir,
      "url"         => "http://example.org",
    }
  end
  let(:config) do
    Jekyll.configuration(overrides)
  end
  let(:site)     { Jekyll::Site.new(config) }
  let(:contents) { File.read(dest_dir("index.html")) }
  before(:each) do
    site.process
  end

  it "slugifies with underscores" do
    expect(contents).to match /tell_me_why_i_don_t_like_hypens/
    expect(contents).to_not match /tell-me-why-i-don-t-like-hypens$/
  end
end
