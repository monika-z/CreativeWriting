json.extract! post, :id, :title, :content, :summary, :user_id, :trio_id, :created_at, :updated_at
json.url post_url(post, format: :json)