json.array!(@profiles) do |profile|
  json.extract! profile, :id, :gender, :birth_year, :first_name, :last_name, :user_id
  json.url profile_url(profile, format: :json)
end
