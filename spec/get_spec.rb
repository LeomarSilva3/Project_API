describe "get" do
    context "when registered a user" do
        #cria um usuario
        let(:user) { build(:registered_user) }
        #faz autenticação para recuperar um token
        let(:token) { ApiUser.token(user.email, user.password) }
        #verifica se o usuario existe na base de dados
        let(:result) { ApiUser.find(token, user.id) }
        let(:user_db) {Database.new.find_user(user.email)}

        it {
            puts result.parsed_response.to_json
            expect(result.response.code).to eql "200"
            expect(result.parsed_response["full_name"]).to eql user_db["full_name"]
            expect(result.parsed_response["password"]).to eql user_db["password"]
            expect(result.parsed_response["email"]).to eql user_db["email"]
        }
        
    end

    context "user not found" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, "0") }
        let(:user_db) {Database.new.find_user(user.email)}

        it {expect(result.response.code).to eql "404"}
       
    end


    context "GET ERRO wrong id" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, "abcdefg") }
        let(:user_db) {Database.new.find_user(user.email)}

        it {expect(result.response.code).to eql "412"}
       
    end

end