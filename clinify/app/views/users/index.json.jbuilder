json.array!(@users) do |user|
  json.extract! user, :id, :name, :cpf, :phoneHome, :phoneMobile, :address, :email, :login, :password
  json.url user_url(user, format: :json)
end
