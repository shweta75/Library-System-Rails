json.extract! item, :id, :isbn, :title, :description, :author, :created_at, :updated_at
json.url item_url(item, format: :json)
