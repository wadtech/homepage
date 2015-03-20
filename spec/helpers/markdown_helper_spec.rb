require "spec_helper"

include MarkdownHelper

describe MarkdownHelper do
  describe "markdown" do
    it "parses markdown into html for display" do
      input = <<-input.strip_heredoc
        Troles and Shiz

        # Wheeee
      input
      expected_html = <<-expected.strip_heredoc
        <p>Troles and Shiz</p>

        <h1>Wheeee</h1>
      expected

      result = markdown input

      expect(result).to eq expected_html
    end
  end

  describe "smart truncate" do
    before :each do
      @paragraph = "This is a paragraph with a word count far exceeding twelve. In fact it could be said that there are more than twenty words here!"
    end

    it "defaults to 12 words" do
      result = smart_truncate @paragraph

      expect(result).to eq "This is a paragraph with a word count far exceeding twelve. In..."
    end

    it "accepts a words parameter to adjust it to 12 words" do
      result = smart_truncate @paragraph, words: 5

      expect(result).to eq "This is a paragraph with..."
    end

    it "adds an ellipsis to indicate truncation" do
      result = smart_truncate @paragraph

      expect(result).to match /\.\.\.$/
    end

    it "accepts sentences instead of words" do
      paragraph = "This paragraph. Is made up of. Arbitrarily short. Sentences."

      result = smart_truncate paragraph, sentences: 3

      expect(result).to eq "This paragraph. Is made up of. Arbitrarily short."
    end
  end
end
