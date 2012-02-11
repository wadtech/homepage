module ApplicationHelper
  # Markdown helpers
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

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
end
