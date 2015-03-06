json.array!(@correspondences) do |correspondence|
  json.extract! correspondence, :id, :first_name, :last_name, :comapny, :designation, :contact_number, :email, :industry, :location, :additional_info
  json.url correspondence_url(correspondence, format: :json)
end
