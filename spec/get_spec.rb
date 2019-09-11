describe "get" do
    context "search a registered new user", :teste do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, user.id) }
        let(:user_db) {Database.new.find_user(user.email)}

        it {expect(result.response.code).to eql "200"}
        
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