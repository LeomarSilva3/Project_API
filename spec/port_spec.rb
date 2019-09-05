describe "post" do
    context "when new user" do
        before do
            @new_user = build(:user).to_hash
                
            @result = HTTParty.post(
                "http://localhost:3001/user",
                body: @new_user.to_json,
                headers: {
                    "Content-Type" => "application/json",
                },
            )    
        end
         
        it{expect(@result.response.code).to eql "200"}
    end

    context "duplicate email" do
        before do
            @new_user = build(:duplicateEmail).to_hash
                
            @result = HTTParty.post(
                "http://localhost:3001/user",
                body: @new_user.to_json,
                headers: {
                    "Content-Type" => "application/json",
                },
            )    
        end
         
        it{expect(@result.response.code).to eql "409"}
    end


    context "wrong email" do
        before do
            @new_user = build(:wrongEmail).to_hash
                
            @result = HTTParty.post(
                "http://localhost:3001/user",
                body: @new_user.to_json,
                headers: {
                    "Content-Type" => "application/json",
                },
            )    
        end
         
        it{expect(@result.response.code).to eql "412"}
    end



    context "not empty fields" do
        before do
            @new_user = build(:NotEmptyfields).to_hash
                
            @result = HTTParty.post(
                "http://localhost:3001/user",
                body: @new_user.to_json,
                headers: {
                    "Content-Type" => "application/json",
                },
            )    
        end
         
        it{expect(@result.response.code).to eql "412"}
    end

    context "not null" do
        before do
            @new_user = build(:NotNull).to_hash
                
            @result = HTTParty.post(
                "http://localhost:3001/user",
                body: @new_user.to_json,
                headers: {
                    "Content-Type" => "application/json",
                },
            )    
        end
         
        it{expect(@result.response.code).to eql "412"}
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