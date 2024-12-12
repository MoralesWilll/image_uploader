json.extract! image, :id, :title, :description, :file, :created_at, :updated_at
json.url image_url(image, format: :json)
json.file url_for(image.file)
