module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end
  # Markdown helpers
  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true, 
      no_intra_emphasis: true,
      fenced_code_blocks: true, 
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  # def syntax_highlighter(html)
  #   doc = Nokogiri::HTML(html)
  #   doc.search("//pre[@lang]").each do |pre|
  #     pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
  #   end
  #   doc.to_s
  # end

  def smart_truncate(s, opts = {})
    opts = {:words => 12}.merge(opts)
    if opts[:sentences]
      return s.split(/\./)[0, opts[:sentences]].map{|s| s.strip}.join('. ') + '.'
    end
    a = s.split(/\s/) # or /[ ]+/ to only split on spaces
    n = opts[:words]
    a[0...n].join(' ') + (a.size > n ? '...' : '')
  end

  def avatar(email)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def latest_tweet(account)
    tweet = Twitter.search("from:#{account.to_s}").first
    tweet.nil? ? "No relevant tweets yet!" : tweet.text
  end
end
