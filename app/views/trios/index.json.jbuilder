json.array!(@trios) do |trio|
  json.extract! trio, :id, :first_id, :second_id, :third_id
  json.url trio_url(trio, format: :json)
end
