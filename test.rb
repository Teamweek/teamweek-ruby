require 'teamweek-ruby'
require 'teamweek/api/test/http_client'

token = ""
workspace = 1

http_client = Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
puts Teamweek::Api::Client.new(http_client, workspace).fetch_tasks
