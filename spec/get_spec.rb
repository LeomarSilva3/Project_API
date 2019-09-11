describe "get" do
    context "when a registered user", :teste do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, user.id) }
        let(:user_db) {Database.new.find_user(user.email)}

        it {expect(result.response.code).to eql "200"}
        
    end

end