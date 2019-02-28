json.extract! news, :id, :title, :t_id, :app_id, :avatar_url, :v_url, :view_count, :update_time, :comment_num, :created_at, :updated_at
json.url news_url(news, format: :json)
