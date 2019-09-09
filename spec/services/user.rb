#criando uma camada de serviços para servir Api user 
class ApiUser
    include HTTparty
    base_uri "http://localhost:3001"
    headers "Content-Type" => "application/json"

    def self.save(user)
        post("/user", body: user.to_json)
    end

    def self.authorization(user)
        post("/auth", body: user.to_json)
    end
end