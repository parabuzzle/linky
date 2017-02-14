json.extract! link, :id, :short_name, :url, :params_url
json.short_url "#{root_url}#{link.short_name}"
json.visits link.clicks
json.extract! link, :created_at, :updated_at
json.url link_url(link, format: :json)
