require 'teamweek-ruby'
require 'teamweek/api/test/http_client'

token = "fOAli8-VmPlJjbB9A-gfRXRA2jDG2zeRBrkYi7AGb41vtkQJz7Iewe1iz5UYWPDoG_lhOB0i4WOcRcfGqe_NsUix3tdXHSS0iMuCIuI7y0wBun_uqgEhedhQ5koZ7CU2p0w7dsTJSTuyIT5H3ab-a2Tfct8CoC1cWAdH6gm9d2pVzHR9JUVdwE5juC3uRIagCn3Pd0ftzKLP54wwnmk20zB6X8JP89k6GdwjM_V2co_X9nKkGAS_UzzP--Iwjfk4PM6NcMMgbjU0F8DDN7r-6AIJX8L2qpOoyh-zBMRsxDKeSj61_z0VkAaN3Aae96H92t_UIsDMfck_o3tZvGhEbQ=="

http_client = Teamweek::Api::Test::HttpClient.new('Authorization' => "Bearer #{ token }")


since_date = "2016-02-15T00:00:00.000+00:00"
until_date = "2016-02-15T00:00:00.000+00:00"
filter = 'timeline'

req = Teamweek::Api::Client.new(http_client, 181896).export_tasks(filter: filter, since: since_date, until: until_date)
puts ">>>>>> #{req}"
