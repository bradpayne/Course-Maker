json.array!(@instructors) do |instructor|
  json.extract! instructor, :id, :comment, :email, :first, :middle, :last
  json.url instructor_url(instructor, format: :json)
end
