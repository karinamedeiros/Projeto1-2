json.array!(@events) do |event|
  json.extract! event, :id, :nome, :descricao, :inicio, :fim
  json.url event_url(event, format: :json)
end
