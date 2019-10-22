json.extract! task, :id, :name, :skills, :status, :priority, :current_agent, :created_at, :updated_at
json.url task_url(task, format: :json)
