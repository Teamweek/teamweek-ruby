require 'teamweek-ruby'
require 'teamweek/api/test/http_client'

token = ""

http_client = Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")

since_date = "2016-02-15T00:00:00.000+00:00"
until_date = "2016-02-15T00:00:00.000+00:00"
filter = 'timeline'

req = Teamweek::Api::Client.new(http_client, 181896).export_tasks(filter: filter, since: since_date, until: until_date)
# req = Teamweek::Api::Client.new(http_client, 181896).export_projects
# req = Teamweek::Api::Client.new(http_client, 181896).export_users
# req = Teamweek::Api::Client.new(http_client, 181896).export_milestones
puts ">>>>>> #{req}"
