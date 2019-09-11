describe "get" do
    context "when a registered user", :teste do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, user.id) }
        let(:user_db) {Database.new.find_user(user.email)}

        it {expect(result.response.code).to eql "200"}
        it {expect(result.parsed_response["full_name"]).to eql user_db["full_name"]}
        it {expect(result.parsed_response["email"]).to eql user_db["email"]}
       
    end

end