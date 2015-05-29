class Github
  def public_activity
    return github.user_public_events((ENV['GITHUB_NAME'] || 'wadtech'), per_page: 10)
  end

  def repositories
    return github.repositories.reject do |repo|
      (repo[:owner][:login] != (ENV['GITHUB_NAME'] || 'wadtech')) || repo[:fork]
    end
  end

  private

  def github
    @github ||= Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end
end
