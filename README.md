A very lightweight ruby library without an http client to communicate with Teamweek API

[![Gem Version](https://badge.fury.io/rb/teamweek-ruby.svg)](http://badge.fury.io/rb/teamweek-ruby)


### Why clientless?

When integrating with more than one remote API (e.g. Teamweek and Basecamp) you
can share one http client class between the multiple API clients, which enables
unified error and access handling.

### HTTP Client

The HTTP client is responsible for authorization, user agent and HTTP caching headers and whatever else you need.
The HTTP client that is passed to the Teamweek::Api::Client must implement the following methods, that this gem uses:
  * ```post(full_path, data)``` - HTTP POST request, which gets the full request uri and request body data as hash and returns the response body as JSON

### Example usage

```ruby
  require 'teamweek-ruby'
  require 'httparty'

  class CustomHttpClient
    attr_accessor :headers

    def initialize(access_token)
      @headers = { "Authorization" => "Bearer #{access_token}", "User-Agent"  => "Teamweek Ruby" }
    end

    def post(path, params)
      #response and error handling can be done here
      HTTParty.post(path, { headers: headers, body: params })
    end

  end

  workspace_id = 123
  access_token = 'some_users_access_token'

  http_client = CustomHttpClient.new(access_token)
  teamweek_ruby = Teamweek::Api::Client.new(http_client, workspace_id)
  projects = teamweek_ruby.import_projects([{name:"My Project"}, {name: "Another project"}])
```

### Building and using the gem

if you want to test your changes, build and install the gem in your machine.

```sh
% gem build teamweek-ruby.gemspec

  Successfully built RubyGem
  Name: teamweek-ruby
  Version: 0.1.0
  File: teamweek-ruby-0.1.0.gem

% gem install teamweek-ruby-0.1.0.gem
% irb
>> require 'teamweek-ruby'
=> true

```