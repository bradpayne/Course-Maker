json.array!(@courses) do |course|
  json.extract! course, :id, :id, :comment, :term, :code, :subjects, :continuity_id, :name, :description, :text, :credits, :indepedent_study
  json.url course_url(course, format: :json)
end
