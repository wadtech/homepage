module MarkdownHelper
  # Markdown helpers
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language, :formatter => 'html', :options => { :linenos => 'inline' })
    end
    def block_html(raw_html)
      if raw_html =~ /^<iframe.*>$/
        raw_html
      end
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(:hard_wrap => true, :filter_html => false)
    options = {
      :autolink           => true,
      :no_intra_emphasis  => true,
      :fenced_code_blocks => true,
      :strikethrough      => true,
      :superscript        => true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
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
end