describe "get" do
    context "when a registered user"do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, user.id) }
        let(:user_db) {Database.new.find_user(user.email)}

        it {expect(result.response.code).to eql "200"}
        # it {expect(result.parsed_response["full_name"]).to eql user_db["full_name"]}
        # it {expect(result.parsed_response["password"]).to eql user_db["password"]}
        # it {expect(result.parsed_response["email"]).to eql user_db["email"]}
       
    end

    context "user not found" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, "0") }
        let(:user_db) {Database.new.find_user(user.email)}

        it {expect(result.response.code).to eql "404"}
       
    end


    context "GET ERRO wrong id", :teste do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, "abcdefg") }
        let(:user_db) {Database.new.find_user(user.email)}

        
        it {expect(result.response.code).to eql "412"}
       
    end

end