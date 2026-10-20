json.extract! cat, :id, :name, :images, :age, :gender, :stayed_or_neutered, :tags, :created_at, :updated_at
json.url cat_url(cat, format: :json)
