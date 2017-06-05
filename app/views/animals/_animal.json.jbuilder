json.extract! animal, :id, :name, :longevity, :preys_id, :predators_id, :created_at, :updated_at
json.url animal_url(animal, format: :json)
