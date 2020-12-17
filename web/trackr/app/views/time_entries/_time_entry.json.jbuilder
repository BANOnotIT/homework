json.extract! time_entry, :id, :title, :start, :end, :user_id, :created_at, :updated_at
json.url time_entry_url(time_entry, format: :json)
