json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :company_name, :industry, :work_description, :feedback_description, :rating
  json.url feedback_url(feedback, format: :json)
end
