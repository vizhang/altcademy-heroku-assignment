json.tasks @tasks do |task|
  json.(task, :id, :content, :completed, :created_at)
end
