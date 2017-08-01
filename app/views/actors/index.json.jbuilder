json.array!(@actors) do |actor|
  json.extract! actor, :id, :name, :birthdate, :birthplace
  json.url actor_url(actor, format: :json)
end
