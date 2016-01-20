json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :check_in, :user_id
  json.url reservation_url(reservation, format: :json)
end
