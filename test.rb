require 'teamweek-ruby'
require 'teamweek/api/test/http_client'

token = ""

http_client = Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")
Teamweek::Api::Client.new(http_client, 181896).fetch_tasks
