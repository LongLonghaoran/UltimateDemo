json.extract! micro_blog, :id, :title, :content, :created_at, :updated_at
json.url micro_blog_url(micro_blog, format: :json)
