Octokit.middleware = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache,
              shared_cache: false,
              store: Rails.cache,
              logger: ActiveSupport::Logger.new(STDOUT)

  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end unless Rails.env.test?
