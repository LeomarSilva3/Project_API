describe "delete" do
    context "when registered a user", :teste do
            #cria um usuario
            let(:user) { build(:remove_user) }
            #faz autenticação para recuperar um token
            let(:token) { ApiUser.token(user.email, user.password) }
            #verifica se o usuario existe na base de dados
            let(:result) { ApiUser.remove(token, user.id) }
      
    
            it {expect(result.response.code).to eql "204"}
    
    
    end


    context "User not found", :teste do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.remove(token, "0") }
       
        it {expect(result.response.code).to eql "404"}
    
    end

    context "Delete Error", :teste do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.remove(token, "abcdefg") }

        it {expect(result.response.code).to eql "412"}
       
    
    end

end