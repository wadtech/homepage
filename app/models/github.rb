class Github
  def public_activity
    return github.user_public_events(Settings.github.login)
  end

  def repositories
    return github.repositories.reject do |repo|
      repo[:owner][:login] != Settings.github.login || repo[:fork]
    end
  end

  private

  def github
    @github ||= Octokit::Client.new(access_token: Settings.github['access_token'])
  end
end
