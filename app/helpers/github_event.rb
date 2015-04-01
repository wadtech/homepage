# maps activity stream events to list items
# https://developer.github.com/v3/activity/events/types
module GithubEvent
  GITHUB_URL = 'https://github.com'

  def event_to_list_item(event)
    item = render_item(event)

    if item.nil?
      $stdout.write "no event handler defined for #{event[:type]}\n"
      return
    end

    content_tag(:li, fa_icon("#{item[:icon]} li", class: item[:name], text: raw(item[:friendly])))
  end

  private

  def render_item(event)
    case event[:type]
    when 'CommitCommentEvent'
      commit_comment(event)
    when 'PushEvent'
      push_event(event)
    when 'WatchEvent'
      watch_event(event)
    end
  end

  def commit_comment(event)
    shortened = MarkdownHelper.smart_truncate(event['comment']['body'], sentences: 1)

    {
      name: 'commit comment',
      url: event['comment']['html_url'],
      friendly: "#{Settings.github.login} commented on a commit: #{shortened}",
      icon: 'comment'
    }
  end

  def push_event(event)
    payload = event[:payload]
    url = GITHUB_URL + '/' + event[:repo][:name] + '/compare/' + payload[:before] + '...' + payload[:head]
    {
      name: 'push',
      url: url,
      friendly: "#{Settings.github.login} pushed #{pluralize(payload[:size], 'commit')} to #{link_to(event[:repo][:name], url)}",
      icon: 'cloud-upload'
    }
  end

  def watch_event(event)
    payload = event[:payload]
    url = "#{GITHUB_URL}/#{event[:repo][:name]}"
    {
      name: 'starred',
      url: url,
      friendly: "#{Settings.github.login} starred #{link_to(event[:repo][:name], url)}",
      icon: 'star'
    }
  end
end
