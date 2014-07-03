json.array!(@records) do |record|
  json.extract! record, :id, :symptom, :exams, :bloodPress, :heartBeat, :history, :observation, :user_id
  json.url record_url(record, format: :json)
end
