Ruby gem to communicate with Teamweek API

###Examples

```ruby
teamweek_account_id = 12345678
access_token = 'YrAdXm1l08kwhW24TV7Cvt9HS4ZscofJGYOU075Tu4hTvQ8kOVjTFgjv5581JN'

client = Teamweek::Api::Client.new(teamweek_account_id, access_token)

exported_users = client.export_users(
	[
		{name: "Jane", email: 'jane@teamweek.com'},
		{name: 'James Bond'}
	])
```