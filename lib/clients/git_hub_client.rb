class GitHubClient
  ACCESS_TOKEN = nil

  def initialize
    @client = Octokit::Client.new(:access_token => ACCESS_TOKEN)

  end

  def create_gist(options)
    @client.post'gists', options
  end

  def gists(user = @client.user)
    @client.get'gists'
  end

  def delete_gist(gist_id)
    @client.send(:boolean_from_response, :delete, "gists/#{gist_id}")
  end
end