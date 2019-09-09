describe "post" do
    context "when new user" do
        before do
            @new_user = build(:user).to_hash
            #criando uma camada de serviços para servir Api user     
            @result = ApiUser.save(@new_user)
        end
         
        it{expect(@result.response.code).to eql "200"}
    end

    context "duplicate email" do
        before do
            @new_user = build(:duplicateEmail).to_hash
                
            @result = @result = ApiUser.save(@new_user)
        end
         
        it{expect(@result.response.code).to eql "409"}
        it{expect(@result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address."}
    end


    context "wrong email" do
        before do
            @new_user = build(:wrongEmail).to_hash
                
            @result = @result = ApiUser.save(@new_user)
            
        end
         
        it{expect(@result.response.code).to eql "412"}
        it{expect(@result.parsed_response["msg"]).to eql "Oops. You entered a wrong email."}
    end



    context "not empty fields" do
        before do
            @new_user = build(:NotEmptyfields).to_hash
                
            @result = @result = ApiUser.save(@new_user)
        end
         
        it{expect(@result.response.code).to eql "412"}
        it{expect(@result.parsed_response["msg"]).to eql "Validation notEmpty failed"}
    end

    context "not null" do
        before do
            @new_user = build(:NotNull).to_hash
                
            @result = @result = ApiUser.save(@new_user)
        end
         
        it{expect(@result.response.code).to eql "412"}
        it{expect(@result.parsed_response["msg"]).to eql "Validation notEmpty failed"}
    end


    context "Success Authorization" do
        
        before do
            @new_user = build(:Success_Authorization).to_hash

            @result = ApiUser.authorization(@new_user)
        end
        
         it{expect(@result.response.code).to eql "200"}
         it{expect(@result.parsed_response).to_json}
    end


    context "Unathorization" do
    
        before do
            @new_user = build(:Unathorization).to_hash

            @result = @result = ApiUser.authorization(@new_user)
        end

        puts @result
        it{expect(@result.response.message).to eql "Unauthorized"}
        
    end



    # it "New user", :newuser do

    #     Database.new.delete_user("eu@leomar.io")

    #     result = HTTParty.post(
    #         "http://localhost:3001/user",
    #         body: {
    #             full_name: "Leomar da Silva Barbosa",
    #             email: "eu@leomar.io",
    #             password: "123456"
    #         }.to_json,
    #         headers: {
    #             "Content-Type" => "application/json",
    #         },
    #     )
    #     puts result
    #     expect(result.response.code).to eql "200"
    # end


end