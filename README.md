A very lightweight ruby library without an http client to communicate with Teamweek API

### Why clientless?

When integrating with more than one remote API (e.g. Teamweek and Basecamp) you
can share one http client class between the multiple API clients, which enables
unified error and access handling.

### HTTP Client

The HTTP client is responsible for authorization, user agent and HTTP caching headers.
The HTTP client that is passed to the Teamweek::Api::Client must implement the following methods, that this gem uses:
  * ```post(full_path, data)``` - HTTP POST request, which gets the full request uri and request body data as hash and returns the response body as JSON